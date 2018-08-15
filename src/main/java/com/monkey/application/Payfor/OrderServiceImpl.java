package com.monkey.application.Payfor;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Device.IDeviceService;
import com.monkey.common.wechatsdk.HttpUtil;
import com.monkey.common.wechatsdk.PayConfig;
import com.monkey.common.wechatsdk.PayToolUtil;
import com.monkey.common.wechatsdk.XMLUtil4jdom;
import com.monkey.core.entity.Device;
import com.monkey.core.entity.Order;
import com.monkey.core.entity.Payfor;
import com.monkey.core.entity.Product;
import com.monkey.core.mapper.DeviceRepository;
import com.monkey.core.mapper.OrderRepository;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.mapper.PayforRepository;
import com.monkey.core.mapper.ProductRepository;
import com.monkey.web.controller.dtos.OrderInput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-13
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderRepository, Order> implements IOrderService {
    //创建订单
    @Autowired
    OrderRepository _orderRepository;
    @Autowired
    IDeviceService _deviceService;
    @Autowired
    ProductRepository _productRepository;
    @Autowired
    PayforRepository _payforRepository;

    @Override
    public Order insertOrder(OrderInput input)throws Exception{
        EntityWrapper ew=new EntityWrapper();
        ew.eq("deviceNum",input.deviceNum);
        Device d=_deviceService.selectOne(ew);
        if(d==null  )throw new Exception("该设备信息不存在");
        Product p=_productRepository.selectById(input.productId);
        if(p==null)throw new Exception("该商品信息不存在");
        Order o=new Order();
        o.setDeviceId(d.getId());
        o.setDeviceName(d.getDeviceName());
        o.setDeviceType(d.getDeviceType());
        o.setOrderState(0);
        o.setPayState(0);
        o.setPrice(input.price);
        o.setProductId(p.getId());
        o.setProductName(p.getProductName());
        o.setPointName(d.getPointName());
        o.setWechatOrder(d.getDeviceNum()+"_"+ System.currentTimeMillis());
        _orderRepository.insert(o);
        return  o;
    }
    @Override
    public String weixinPay(Order input) throws Exception {
        EntityWrapper ew=new EntityWrapper();
         List<Payfor> list=   _payforRepository.selectList(ew);
        Payfor p=list.get(0);
        if(list.isEmpty()|| p==null)throw new Exception("该商户支付信息不存在");
        String out_trade_no = input.getWechatOrder(); //订单号 （调整为自己的生产逻辑）
        // 账号信息
        String appid = p.getWechatpayId();  // appid
        //String appsecret = PayConfigUtil.APP_SECRET; // appsecret
        String mch_id = p.getWechatpayAgent(); // 商业号
        String key = p.getWechatpayKey(); // key

        String currTime = PayToolUtil.getCurrTime();
        String strTime = currTime.substring(8, currTime.length());
        String strRandom = PayToolUtil.buildRandom(4) + "";
        String nonce_str = strTime + strRandom;

        // 获取发起电脑 ip
        String spbill_create_ip = PayConfig.Create_Ip;
        // 回调接口
        String notify_url = PayConfig.Notify_Url;
        String trade_type = "NATIVE";

        SortedMap<Object,Object> packageParams = new TreeMap<Object,Object>();
        packageParams.put("appid", appid);
        packageParams.put("mch_id", mch_id);
        packageParams.put("nonce_str", nonce_str);
        packageParams.put("body", input.getProductName());  //（调整为自己的名称）
        packageParams.put("out_trade_no", out_trade_no);
        packageParams.put("total_fee", input.getPrice().toString()); //价格的单位为分
        packageParams.put("spbill_create_ip", spbill_create_ip);
        packageParams.put("notify_url", notify_url);
        packageParams.put("trade_type", trade_type);
        String sign = PayToolUtil.createSign("UTF-8", packageParams,key);
        packageParams.put("sign", sign);

        String requestXML = PayToolUtil.getRequestXml(packageParams);
        System.out.println(requestXML);

        String resXml = HttpUtil.postData(PayConfig.Ufdoder_Url, requestXML);

        Map map = XMLUtil4jdom.doXMLParse(resXml);
        String urlCode = (String) map.get("code_url");

        return urlCode;
    }

    @Override
    public void updateOrderStatte(String orderNum,Integer state) {
         _orderRepository.updateOrderState(orderNum,state);
    }
}
