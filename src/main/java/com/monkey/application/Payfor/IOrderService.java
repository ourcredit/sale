package com.monkey.application.Payfor;

import com.monkey.core.dtos.OrderStaticialDto;
import com.monkey.core.entity.Order;
import com.baomidou.mybatisplus.service.IService;
import com.monkey.core.entity.Payfor;
import com.monkey.web.controller.dtos.OrderInput;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-13
 */
public interface IOrderService extends IService<Order> {
    Order insertOrder(OrderInput input) throws Exception;

    String weixinPay(Order input) throws Exception;

    String aliPay(Order input) throws Exception;

    void updateOrderStatte(String orderNum, Integer orderState, Integer payState,String backNum);

    String weixinBack(Order input) throws  Exception;
    Map<String,Object> getDashboard();
    Map<String,Object> getStaticial(Date start,Date end);
    Payfor getPayforByOrder(String appId,String mch_id);
    Payfor getPayforByAppId(String appId);
    String  aliback(Order input)throws  Exception;
}
