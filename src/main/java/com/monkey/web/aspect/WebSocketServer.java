package com.monkey.web.aspect;


import java.beans.IntrospectionException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import com.monkey.application.Payfor.IMainorderService;
import com.monkey.web.config.SpringContextBean;
import com.monkey.web.controller.dtos.WebSocketMessage;
import org.apache.commons.collections.map.CompositeMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import springfox.documentation.spring.web.json.Json;

@ServerEndpoint(value = "/websocket/{tenantId}/{clientId}")
@Component
public class WebSocketServer {
    @Autowired
    IMainorderService _orderService;
    private static Map<String,Integer> clientsState=new ConcurrentHashMap<>();
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static Map<Integer, Integer> onlineCount = new ConcurrentHashMap();
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private static Map<Integer, Map<String, WebSocketServer>> clients = new ConcurrentHashMap();
    //   private static Map<String, WebSocketServer> clients = new ConcurrentHashMap<String, WebSocketServer>();
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    private String clientId;
    private Integer tenantId;
    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("clientId") String clientId, @PathParam("tenantId") Integer tenantId) {
        this.session = session;
        this.clientId = clientId;
        this.tenantId = tenantId;
        Map<String, WebSocketServer> mm=new ConcurrentHashMap<>();
        mm.put(this.clientId, this);
        clients.put(this.tenantId, mm);     //加入set中
        clientsState.put(this.clientId,1);
        addOnlineCount(this.tenantId);           //在线数加1
        try {
            WebSocketMessage m = new WebSocketMessage(this.clientId, "", "链接服务器成功", 1, true,this.tenantId);
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
        Map<String,WebSocketServer> client=  clients.get(this.tenantId);  //从set中删除
        client.remove(this.clientId);
        clientsState.put(this.clientId,0);
        subOnlineCount(this.tenantId);           //在线数减1
    }
    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message) throws IOException {
        if (this._orderService == null) {
            this._orderService = SpringContextBean.getBean(IMainorderService.class);
        }
        JSONObject jsonTo = JSONObject.parseObject(message);
        String order = (String) jsonTo.get("order");
        Integer type = (Integer) jsonTo.get("type");
        if (type == 4) {
            _orderService.updateOrderStatte(order, 1, null);
        }
        WebSocketMessage m = new WebSocketMessage(this.clientId, order, "出货状态修改成功", 4, true,this.tenantId);
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
        String json = JSON.toJSONString(message);
        Integer tenantId = message.tenantId;
        Map<String, WebSocketServer> maps = clients.get(tenantId);
        for (WebSocketServer item : maps.values()) {
            if (item.clientId != null && item.clientId.equals(message.to))
                item.session.getAsyncRemote().sendText(json);
        }
    }
    public void sendMessageAll(WebSocketMessage message) throws IOException {
        String json = JSON.toJSONString(message);
        Integer tenantId = message.tenantId;
        Map<String, WebSocketServer> maps = clients.get(tenantId);
        for (WebSocketServer item : maps.values()) {
            item.session.getAsyncRemote().sendText(json);
        }
    }

    public static synchronized int getOnlineCount(Integer tenantId) {
        if(onlineCount.isEmpty())return 0;
        return onlineCount.get(tenantId);
    }

    public static synchronized void addOnlineCount(Integer tenantId) {
        Integer count = onlineCount.get(tenantId);
        if(count==null){
            count=0;
        }
        count++;
        onlineCount.put(tenantId, count);
    }

    public static synchronized void subOnlineCount(Integer tenantId) {
        Integer count = onlineCount.get(tenantId);
        if(count==null){
            count=0;
        }else if(count>0){
            count--;

        }
        onlineCount.put(tenantId, count);
    }

    public static synchronized Map<String, WebSocketServer> getClients(int tenantId) {
        return clients.get(tenantId);
    }
}