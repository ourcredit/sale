package com.monkey.application.Payfor;

import com.monkey.core.entity.Order;
import com.baomidou.mybatisplus.service.IService;
import com.monkey.web.controller.dtos.OrderInput;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-13
 */
public interface IOrderService extends IService<Order> {
    Order insertOrder(OrderInput input)throws Exception;
    String weixinPay(Order input) throws Exception;
  void updateOrderStatte(String orderNum,Integer orderState ,Integer payState);
}
