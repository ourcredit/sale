package com.monkey.application.Payfor;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.monkey.core.dtos.DeviceSaleStatical;
import com.monkey.core.dtos.ProductSaleStatical;
import com.monkey.core.entity.Mainorder;
import com.monkey.core.entity.Payfor;
import com.monkey.core.entity.Suborder;
import com.monkey.web.controller.dtos.OrderInput;
import com.monkey.web.controller.dtos.StaticalInput;

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
public interface IMainorderService extends IService<Mainorder> {
    Mainorder insertOrder(OrderInput input) throws Exception;

    String weixinPay(Mainorder input) throws Exception;

    String aliPay(Mainorder input) throws Exception;

    void updateOrderStatte(String orderNum, Integer orderState, Integer payState);
    void updateSubOrderStatte(String orderNum, Integer orderState, Integer payState);

    String weixinBack(Mainorder input) throws  Exception;
     String weixinBackSingle(Mainorder order,Suborder input) throws Exception;
    Map<String,Object> getDashboard(Integer tenantId);
    Map<String,Object> getStaticial(Integer tenantId, Date start, Date end);
    Payfor getPayforByOrder(String appId, String mch_id);
    Payfor getPayforByAppId(String appId);
    String  aliback(Mainorder input)throws  Exception;
    String  alibacksingle(Mainorder input,Suborder sub)throws  Exception;
    Page<DeviceSaleStatical> getDeviceSaleStatical(Page<DeviceSaleStatical> page, StaticalInput input );
    Page<ProductSaleStatical>  getProductSaleStatical(Page<ProductSaleStatical> page, StaticalInput input );
}
