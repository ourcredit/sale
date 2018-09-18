package com.monkey.core.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.monkey.core.dtos.DeviceSaleStatical;
import com.monkey.core.dtos.ProductSaleStatical;
import com.monkey.core.dtos.SalePercentDto;
import com.monkey.core.dtos.TodayStatical;
import com.monkey.core.entity.Order;
import com.monkey.core.entity.Payfor;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-09-12
 */
public interface OrderRepository extends BaseMapper<Order> {
    void updateOrderState(@Param("num") String num, @Param("orderState") Integer orderState, @Param("payState") Integer payState);
    void updateSubOrderState(@Param("num") String num, @Param("orderState") Integer orderState, @Param("payState") Integer payState);

    TodayStatical getOrderStatical(@Param("tenantId") Integer tenantId, @Param("start") Date start, @Param("end") Date end);

    List<SalePercentDto> getTodaySalePercent(@Param("tenantId") Integer tenantId, @Param("start") Date start, @Param("end") Date end);

    List<SalePercentDto> getMonthSalePercent(@Param("tenantId") Integer tenantId,@Param("start") Date start, @Param("end") Date end);

    List<SalePercentDto> getPointSalePercent(@Param("tenantId") Integer tenantId,@Param("start") Date start, @Param("end") Date end);

    List<SalePercentDto> getPayTypePercent(@Param("tenantId") Integer tenantId,@Param("start") Date start, @Param("end") Date end);

    Order selectOrderById(@Param("order")String order);
    Payfor getPayforByOrder(@Param("appId") String appId, @Param("mch_id") String mch_id);

    Payfor getPayforByAppId(@Param("appId") String appId);
    List<DeviceSaleStatical> getDeviceSaleStatical(@Param("tenantId") Integer tenantId, Pagination page, @Param("deviceName") String deviceName, @Param("pointName") String pointName, @Param("start") Date start, @Param("end") Date end);

    List<ProductSaleStatical> getProductSaleStatical(Integer tenantId, Pagination page, @Param("productName") String productName, @Param("deviceName") String deviceName, @Param("start") Date start, @Param("end") Date end);

}
