package com.monkey.application.Payfor;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Device.IDeviceService;
import com.monkey.common.util.DateUtil;
import com.monkey.common.wechatsdk.HttpUtil;
import com.monkey.common.wechatsdk.PayConfig;
import com.monkey.common.wechatsdk.PayToolUtil;
import com.monkey.common.wechatsdk.XMLUtil4jdom;
import com.monkey.core.dtos.SalePercentDto;
import com.monkey.core.dtos.TodayStatical;
import com.monkey.core.entity.Device;
import com.monkey.core.entity.Order;
import com.monkey.core.entity.Payfor;
import com.monkey.core.entity.Product;
import com.monkey.core.mapper.OrderRepository;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.mapper.PayforRepository;
import com.monkey.core.mapper.ProductRepository;
import com.monkey.web.controller.dtos.OrderInput;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.net.ssl.SSLContext;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.*;
import java.security.KeyStore;
/**
 * <p>
 * 服务实现类
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
    protected static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Override
    public Order insertOrder(OrderInput input) throws Exception {
        EntityWrapper ew = new EntityWrapper();
        ew.eq("deviceNum", input.deviceNum);
        Device d = _deviceService.selectOne(ew);
        if (d == null) throw new Exception("该设备信息不存在");
        Product p = _productRepository.selectById(input.productId);
        if (p == null) throw new Exception("该商品信息不存在");
        Order o = new Order();
        o.setDeviceId(d.getId());
        o.setDeviceName(d.getDeviceName());
        o.setDeviceType(d.getDeviceType());
        o.setOrderState(0);
        o.setPayState(0);
        o.setPayType(1);
        o.setPrice(input.price);
        o.setProductId(p.getId());
        o.setProductName(p.getProductName());
        o.setPointName(d.getPointName());
        o.setWechatOrder(d.getDeviceNum() + "_" + System.currentTimeMillis());
        _orderRepository.insert(o);
        return o;
    }

    @Override
    public String weixinPay(Order input) throws Exception {
        EntityWrapper ew = new EntityWrapper();
        List<Payfor> list = _payforRepository.selectList(ew);
        Payfor p = list.get(0);
        if (list.isEmpty() || p == null) throw new Exception("该商户支付信息不存在");
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

        SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();
        packageParams.put("appid", appid);
        packageParams.put("mch_id", mch_id);
        packageParams.put("nonce_str", nonce_str);
        packageParams.put("body", input.getProductName());  //（调整为自己的名称）
        packageParams.put("out_trade_no", out_trade_no);
        packageParams.put("total_fee", input.getPrice().toString()); //价格的单位为分
        packageParams.put("spbill_create_ip", spbill_create_ip);
        packageParams.put("notify_url", notify_url);
        packageParams.put("trade_type", trade_type);
        String sign = PayToolUtil.createSign("UTF-8", packageParams, key);
        packageParams.put("sign", sign);

        String requestXML = PayToolUtil.getRequestXml(packageParams);
        System.out.println(requestXML);

        String resXml = HttpUtil.postData(PayConfig.Ufdoder_Url, requestXML);

        Map map = XMLUtil4jdom.doXMLParse(resXml);
        logger.warn(JSON.toJSONString(map));
        String urlCode = (String) map.get("code_url");

        return urlCode;
    }

    @Override
    public String aliPay(Order input) throws Exception {
        return "";
    }

    @Override
    public Map<String, Object> getDashboard() {
        Map<String, Object> result = new HashMap<>();
        List<SalePercentDto> dr = _orderRepository.getTodaySalePercent(DateUtil.getStartTime(), DateUtil.getEndTime());
        List<SalePercentDto> mr = _orderRepository.getMonthSalePercent(DateUtil.getBeginDayOfMonth(), DateUtil.getEndDayOfMonth());
        List<SalePercentDto> pr = _orderRepository.getPayTypePercent(DateUtil.getBeginDayOfMonth(), DateUtil.getEndDayOfMonth());
        List<SalePercentDto> topdr = _orderRepository.getPointSalePercent(DateUtil.getStartTime(), DateUtil.getEndTime());
        List<SalePercentDto> topmr = _orderRepository.getPointSalePercent(DateUtil.getBeginDayOfMonth(), DateUtil.getEndDayOfMonth());
        result.put("todaySale", getDayKeysAndValues(dr));
        result.put("monthSale", getMonthKeysAndValues(mr));
        result.put("payType", pr);
        result.put("todayTop", getKeysAndValues(topdr));
        result.put("monthTop", getKeysAndValues(topmr));
        return result;
    }

    @Override
    public Map<String, Object> getStaticial(Date start, Date end) {
        Map<String, Object> result = new HashMap<>();
        TodayStatical tr = _orderRepository.getOrderStatical(DateUtil.getStartTime(), DateUtil.getEndTime());
        TodayStatical mr = _orderRepository.getOrderStatical(DateUtil.getStartTime(start), DateUtil.getEndTime(end));
        result.put("today", tr);
        result.put("month", mr);
        return result;
    }

    @Override
    public Payfor getPayforByOrder(String appId,String mch_id) {
       return  _orderRepository.getPayforByOrder(appId,mch_id);
    }

    @Override
    public void updateOrderStatte(String orderNum, Integer orderState, Integer payState,String backNum) {
        _orderRepository.updateOrderState(orderNum, orderState, payState,backNum);
    }
    /*
        * 微信退款功能
        * */
    @Override
    public String weixinBack(Order input) throws Exception {
        EntityWrapper ew = new EntityWrapper();
        List<Payfor> list = _payforRepository.selectList(ew);
        Payfor p = list.get(0);
        if (list.isEmpty() || p == null) throw new Exception("该商户支付信息不存在");
        String out_trade_no = input.getWechatOrder(); //订单号 （调整为自己的生产逻辑）
        // 账号信息
        String appid = p.getWechatpayId();  // appid
        String mch_id = p.getWechatpayAgent(); // 商业号
        String key = p.getWechatpayKey(); // key
        String currTime = PayToolUtil.getCurrTime();
        String strTime = currTime.substring(8, currTime.length());
        String strRandom = PayToolUtil.buildRandom(4) + "";
        String nonce_str = strTime + strRandom;
        // 回调接口
        String notify_url = PayConfig.Back_Url;
        SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();
        packageParams.put("appid", appid);
        packageParams.put("mch_id", mch_id);
        packageParams.put("nonce_str", nonce_str);
        packageParams.put("out_trade_no", out_trade_no);
        packageParams.put("out_refund_no", input.getDeviceId()+""+System.currentTimeMillis());
    //    packageParams.put("refund_desc", 111);  //（调整为自己的名称）
        packageParams.put("total_fee", input.getPrice().toString()); //价格的单位为分
        packageParams.put("refund_fee", input.getPrice().toString());
        packageParams.put("notify_url", notify_url);
        String sign = PayToolUtil.createSign("UTF-8", packageParams, key);
        packageParams.put("sign", sign);

        String requestXML = PayToolUtil.getRequestXml(packageParams);
        String resXml =HttpUtil.back(requestXML,p);
        return resXml;
    }

    private Map<String, Object> getDayKeysAndValues(List<SalePercentDto> list) {
        List<String> keys = new ArrayList<>();
        List<Integer> values = new ArrayList<>();
        for (int i = 0; i < 24; i++) {
            String t = "";
            if (i <= 9) {
                t = "0" + i;
            } else {
                t = "" + i;
            }
            keys.add(t);
            Integer v = 0;
            for (int j = 0; j < list.size(); j++) {
                SalePercentDto temp = list.get(j);
                if (temp.getTime().equals(t)) {
                    v = temp.getCount();
                }
            }
            values.add(v);
        }
        Map<String, Object> r = new HashMap<>();
        r.put("keys", keys);
        r.put("values", values);
        return r;
    }


    private Map<String, Object> getKeysAndValues(List<SalePercentDto> list) {
        List<String> keys = new ArrayList<>();
        List<Integer> values = new ArrayList<>();
        for (int j = 0; j < list.size(); j++) {
            SalePercentDto temp = list.get(j);
            keys.add(temp.getTime());
            values.add(temp.getCount());
        }
        Map<String, Object> r = new HashMap<>();
        r.put("keys", keys);
        r.put("values", values);
        return r;
    }

    private Map<String, Object> getMonthKeysAndValues(List<SalePercentDto> list) {
        List<String> keys = new ArrayList<>();
        List<Integer> values = new ArrayList<>();
        for (int i = 1; i <= 31; i++) {
            String t = "";
            if (i <= 9) {
                t = "0" + i;
            } else {
                t = "" + i;
            }
            keys.add(t);
            Integer v = 0;
            for (int j = 0; j < list.size(); j++) {
                SalePercentDto temp = list.get(j);
                if (temp.getTime() .equals(t) ) {
                    v = temp.getCount();
                }
            }
            values.add(v);
        }
        Map<String, Object> r = new HashMap<>();
        r.put("keys", keys);
        r.put("values", values);
        return r;
    }
}
