package com.monkey.web.controller;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Payfor.IOrderService;
import com.monkey.application.Payfor.ISerialService;
import com.monkey.common.util.CipherTextUtil;
import com.monkey.common.wechatsdk.PayToolUtil;
import com.monkey.common.wechatsdk.XMLUtil4jdom;
import com.monkey.core.entity.Order;
import com.monkey.core.entity.Payfor;
import com.monkey.core.entity.Serial;
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
    @Autowired
    ISerialService _serialService;
    private SortedMap<Object, Object> getparams(Map<String, String> m) {
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
        return packageParams;
    }
    ///插入流水表
    private void insertSerial(Order order,Integer type,String backOrder) {
        Serial s = new Serial();
        s.setDeviceId(order.getDeviceId());
        s.setDeviceName(order.getDeviceName());
        s.setOrder(order.getWechatOrder());
        s.setPointId(order.getPointId());
        s.setPointName(order.getPointName());
        s.setPrice(order.getPrice());
        s.setType(type);
        s.setProductId(order.getProductId());
        s.setProductName(order.getProductName());
        s.setPrice(order.getPrice());
        s.setBackOrder(backOrder);
        _serialService.insert(s);
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
        SortedMap<Object, Object> packageParams = getparams(m);
        // 账号信息
        String key = ""; // key
        //判断签名是否正确
        //  if(PayToolUtil.isTenpaySign("UTF-8", packageParams,key)) {
        //------------------------------
        //处理业务开始
        //------------------------------
        String resXml = "";
        if ("SUCCESS".equals(packageParams.get("return_code"))) {
            String appId = packageParams.get("appid").toString();
            String mch_id = packageParams.get("mch_id").toString();
            Payfor p = _orderService.getPayforByOrder(appId, mch_id);
            if(p==null||p.getAlipayAgent().isEmpty()){
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
                BufferedOutputStream out = new BufferedOutputStream(
                        response.getOutputStream());
                out.write(resXml.getBytes());
                out.flush();
                out.close();
                System.out.println("获取租户对象失败");
            }
            //解密
            String text = packageParams.get("req_info").toString();
            text = CipherTextUtil.dedede(text, p.getWechatpayKey());
            System.out.println("解密后的参数:" + text.toString());
            m = XMLUtil4jdom.doXMLParse(text);
            packageParams = getparams(m);
            if ("SUCCESS".equals(packageParams.get("refund_status"))) {
                // 这里是退款成功
                String out_trade_no = (String) packageParams.get("out_trade_no");
                String back_id = (String) packageParams.get("out_refund_no");
                EntityWrapper e=new EntityWrapper();
                e.eq("wechatOrder",out_trade_no);
                Order o= _orderService.selectOne(e);
                //////////更新订单信息////////////////
                _orderService.updateOrderStatte(out_trade_no, null, 2, back_id);

                insertSerial(o,2,back_id);
                // 向微信服务器发送确认信息，若不发送，微信服务器会间隔不同的时间调用回调方法
                BufferedOutputStream out = new BufferedOutputStream(
                        response.getOutputStream());
                resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
                        + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
                out.write(resXml.getBytes());
                out.flush();
                out.close();
                System.out.println("通知微信.异步确认成功");
            }else{
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
                BufferedOutputStream out = new BufferedOutputStream(
                        response.getOutputStream());
                out.write(resXml.getBytes());
                out.flush();
                out.close();
                System.out.println("退款解密内容退款状态失败");
            }

        } else {
            resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                    + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            BufferedOutputStream out = new BufferedOutputStream(
                    response.getOutputStream());
            out.write(resXml.getBytes());
            out.flush();
            out.close();
            System.out.println("回掉请求失败");
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
        SortedMap<Object, Object> packageParams = getparams(m);
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
                EntityWrapper e=new EntityWrapper();
                e.eq("wechatOrder",out_trade_no);
                Order o= _orderService.selectOne(e);
                if(o!=null){
                    _orderService.updateOrderStatte(out_trade_no, null, 1, null);
                    insertSerial(o,1,"");
                    ///////////通知客户端修改状态/////////
                    String did = out_trade_no.split("_")[0];
                    WebSocketServer ws = WebSocketServer.getClients(o.getTenantId()).get(did);
                    if (ws != null) {
                        WebSocketMessage mm = new WebSocketMessage(did, out_trade_no, "支付成功", 2, true,o.getTenantId());
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
    /**
     * 支付宝支付回调
     * @Author 小柒
     * @param request
     * @param response
     * @throws Exception
     * void
     * @Date 2016年10月31日 更新日志 2016年10月31日 小柒 首次创建
     *
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/alinotify")
    public void alipay_notify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("调用支付宝支付成功回调方法");
        String message = "success";
        Map<String, String> params = new HashMap<String, String>();
// 取出所有参数是为了验证签名
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement();
            params.put(parameterName, request.getParameter(parameterName));
        }

        String appId = params.get("app_id").toString();
        Payfor p = _orderService.getPayforByAppId(appId);
        if(p==null||p.getAlipayAgent().isEmpty()){
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            out.write("failed".getBytes());
            out.flush();
            out.close();
        }
//验证签名
        boolean signVerified = false;
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, p.getAlipayAgent(), "UTF-8");
        } catch (AlipayApiException e) {
            e.printStackTrace();
            message = "failed";
        }
        if (signVerified) {
            System.out.println("验证签名成功s");
// 若参数中的appid和填入的appid不相同，则为异常通知
            if (!p.getAlipayId().equals(params.get("app_id"))) {
                System.out.println("验证签名成功s");
                message = "failed";
            }else{
                String outtradeno = params.get("out_trade_no");
                System.out.println(outtradeno + "号订单回调通知。");
//在数据库中查找订单号对应的订单，并将其金额与数据库中的金额对比，若对不上，也为异常通知
                String status = params.get("trade_status");
                if (status.equals("WAIT_BUYER_PAY")) { // 如果状态是正在等待用户付款

                } else if (status.equals("TRADE_CLOSED")) { // 如果状态是未付款交易超时关闭，或支付完成后全额退款

                } else if (status.equals("TRADE_SUCCESS") || status.equals("TRADE_FINISHED")) {
                    // 如果状态是已经支付成功成功 更新状态
                    _orderService.updateOrderStatte(outtradeno,null,1,"");
                    EntityWrapper e=new EntityWrapper();
                    e.eq("wechatOrder",outtradeno);
                    Order o= _orderService.selectOne(e);
                    insertSerial(o,1,"");
                }
                System.out.println(outtradeno + "订单的状态已经修改为" + status);
            }
        } else { // 如果验证签名没有通过
            message = "failed";
            System.out.println("验证签名失败！");
        }
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        out.write(message.getBytes());
        out.flush();
        out.close();
    }
}
