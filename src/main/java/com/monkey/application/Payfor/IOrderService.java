package com.monkey.application.Payfor;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.monkey.core.dtos.DeviceSaleStatical;
import com.monkey.core.dtos.ProductSaleStatical;
import com.monkey.core.entity.Order;
import com.monkey.core.entity.Payfor;
import com.monkey.core.entity.Suborder;
import com.monkey.web.controller.dtos.OrderInput;
import com.monkey.web.controller.dtos.StaticalInput;
import org.aspectj.weaver.ast.Or;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-09-12
 */
public interface IOrderService extends IService<Order> {
    Order insertOrder(OrderInput input) throws Exception;

    String weixinPay(Order input) throws Exception;

    String aliPay(Order input) throws Exception;

    void updateOrderStatte(String orderNum, Integer orderState, Integer payState);
    void updateSubOrderStatte(String orderNum, Integer orderState, Integer payState);

    Order selectOrderById(String order);
    String weixinBack(Order input) throws  Exception;
     String weixinBackSingle(Order order, Suborder input) throws Exception;
    Map<String,Object> getDashboard(Integer tenantId);
    Map<String,Object> getStaticial(Integer tenantId, Date start, Date end);
    Payfor getPayforByOrder(String appId, String mch_id);
    Payfor getPayforByAppId(String appId);
    String  aliback(Order input)throws  Exception;
    String  alibacksingle(Order input, Suborder sub)throws  Exception;
    Page<DeviceSaleStatical> getDeviceSaleStatical(Page<DeviceSaleStatical> page, StaticalInput input );
    Page<ProductSaleStatical>  getProductSaleStatical(Page<ProductSaleStatical> page, StaticalInput input );
}
