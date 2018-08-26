package com.monkey.web.controller;

import com.alibaba.fastjson.JSON;
import com.monkey.application.Payfor.IOrderService;
import com.monkey.common.wechatsdk.PayToolUtil;
import com.monkey.common.wechatsdk.XMLUtil4jdom;
import com.monkey.web.aspect.WebSocketServer;
import com.monkey.web.controller.dtos.WebSocketMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.*;

@RestController
@RequestMapping(value = "/pay")
public class NotifyController {
    @Autowired
    IOrderService _orderService;


        private  SortedMap<Object, Object> getparams(Map<String, String> m ){
            //过滤空 设置 TreeMap
            SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();
            Iterator it = m.keySet().iterator();
            while (it.hasNext()) {
                String parameter = (String) it.next();
                String parameterValue = m.get(parameter);
                String v = "";
                if (null != parameterValue) {
                    v = parameterValue.trim();
                }
                packageParams.put(parameter, v);
            }
            return  packageParams;
        }
    @RequestMapping(value = "/back")
    public void weixin_back(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("调用退款回调方法");
        //获取退款的参数
        InputStream inputStream;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s;
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        while ((s = in.readLine()) != null) {
            sb.append(s);
        }
        in.close();
        inputStream.close();
        //解析xml成map
        Map<String, String> m = XMLUtil4jdom.doXMLParse(sb.toString());
        SortedMap<Object, Object> packageParams=getparams(m);
        // 账号信息
        String key = ""; // key
        //判断签名是否正确
        //  if(PayToolUtil.isTenpaySign("UTF-8", packageParams,key)) {
        if (true) {
            //------------------------------
            //处理业务开始
            //------------------------------
            String resXml = "";
            if ("SUCCESS".equals((String) packageParams.get("result_code"))) {
                // 这里是退款成功
                String out_trade_no = (String) packageParams.get("out_trade_no");
                String transaction_id = (String) packageParams.get("transaction_id");

                //////////更新订单信息////////////////
                _orderService.updateOrderStatte(out_trade_no, null,-1);
                // 向微信服务器发送确认信息，若不发送，微信服务器会间隔不同的时间调用回调方法
                BufferedOutputStream out = new BufferedOutputStream(
                        response.getOutputStream());
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                        + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
                out.write(resXml.getBytes());
                out.flush();
                out.close();
                System.out.println("通知微信.异步确认成功");
            } else {
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
                BufferedOutputStream out = new BufferedOutputStream(
                        response.getOutputStream());
                out.write(resXml.getBytes());
                out.flush();
                out.close();
                System.out.println("执行退款回调函数失败");
            }
        } else {
        }
    }
    @RequestMapping(value = "/notify")
    public void weixin_notify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("调用支付成功回调方法");
        //读取参数
        InputStream inputStream;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s;
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        while ((s = in.readLine()) != null) {
            sb.append(s);
        }
        in.close();
        inputStream.close();

        //解析xml成map
        Map<String, String> m = XMLUtil4jdom.doXMLParse(sb.toString());
        SortedMap<Object, Object> packageParams=getparams(m);
        // 账号信息
        String key = ""; // key
        //判断签名是否正确
        //  if(PayToolUtil.isTenpaySign("UTF-8", packageParams,key)) {
        if (true) {
            //------------------------------
            //处理业务开始
            //------------------------------
            String resXml = "";
            if ("SUCCESS".equals((String) packageParams.get("result_code"))) {
                // 这里是支付成功
                //////////执行自己的业务逻辑////////////////
                String mch_id = (String) packageParams.get("mch_id");
                String openid = (String) packageParams.get("openid");
                String is_subscribe = (String) packageParams.get("is_subscribe");
                String out_trade_no = (String) packageParams.get("out_trade_no");
                String total_fee = (String) packageParams.get("total_fee");
                String cash_fee_s = (String) packageParams.get("cash_fee");
                String cash_fee = String.valueOf(Integer.parseInt(cash_fee_s) / 100);
                //  String time_end = MctsUtils.numberDateToDate((String) packageParams.get("time_end"));
                String transaction_id = (String) packageParams.get("transaction_id");

                //////////执行自己的业务逻辑（报存订单信息到数据库）////////////////
                _orderService.updateOrderStatte(out_trade_no, null,1);
                ///////////通知客户端修改状态/////////
                String did = out_trade_no.split("_")[0];
                WebSocketServer ws = WebSocketServer.getClients().get(did);
                if (ws != null) {
                    WebSocketMessage mm=new WebSocketMessage(did,out_trade_no,"支付成功",2,true);
                    ws.sendMessageTo(mm);

                    // 向微信服务器发送确认信息，若不发送，微信服务器会间隔不同的时间调用回调方法
                    BufferedOutputStream out = new BufferedOutputStream(
                            response.getOutputStream());
                    resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                            + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
                    out.write(resXml.getBytes());
                    out.flush();
                    out.close();
                    System.out.println("通知微信.异步确认成功");
                }

            } else {
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
                BufferedOutputStream out = new BufferedOutputStream(
                        response.getOutputStream());
                out.write(resXml.getBytes());
                out.flush();
                out.close();
                System.out.println("执行支付回掉函数失败");
            }
        } else {
        }
    }
}
