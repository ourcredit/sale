package com.monkey.web.aspect;


import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.monkey.application.Payfor.IOrderService;
import com.monkey.web.config.SpringContextBean;
import com.monkey.web.controller.dtos.WebSocketMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import springfox.documentation.spring.web.json.Json;

@ServerEndpoint(value = "/websocket/{clientId}")
@Component
public class WebSocketServer {
    @Autowired
    IOrderService _orderService;
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private static Map<String, WebSocketServer> clients = new ConcurrentHashMap<String, WebSocketServer>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    private  String clientId;
    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("clientId") String clientId) {
        this.session = session;
        this.clientId=clientId;
        clients.put(this.clientId, this);     //加入set中
        addOnlineCount();           //在线数加1
        try {
            WebSocketMessage m=new WebSocketMessage(this.clientId,"","链接服务器成功",1,true);
            sendMessageTo(m);
        } catch (IOException e) {

        }
    }
    //	//连接打开时执行
    //	@OnOpen
    //	public void onOpen(@PathParam("user") String user, Session session) {
    //		currentUser = user;
    //		System.out.println("Connected ... " + session.getId());
    //	}

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        clients.remove(clientId);  //从set中删除
        subOnlineCount();           //在线数减1
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message)throws IOException  {
        if(this._orderService==null){
            this._orderService=SpringContextBean.getBean(IOrderService.class);
        }
        JSONObject jsonTo =  JSONObject.parseObject(message);
        String order= (String)jsonTo.get("order");
        _orderService.updateOrderStatte(order,1,null);
        WebSocketMessage m=new WebSocketMessage(this.clientId,order,"出货状态修改成功",4,true);
        sendMessageTo(m);

    }

    /**
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        error.printStackTrace();
    }


    public void sendMessageTo(WebSocketMessage message) throws IOException {
        String json=JSON.toJSONString(message);
        for (WebSocketServer item : clients.values()) {
            if (item.clientId!=null&& item.clientId.equals(message.to) )
                item.session.getAsyncRemote().sendText(json);
        }
    }

    public void sendMessageAll(WebSocketMessage message) throws IOException {
        String json=JSON.toJSONString(message);
        for (WebSocketServer item : clients.values()) {
            item.session.getAsyncRemote().sendText(json);
        }
    }

    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }
    public static synchronized Map<String, WebSocketServer> getClients() {
        return clients;
    }
}