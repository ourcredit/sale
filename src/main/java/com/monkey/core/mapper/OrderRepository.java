package com.monkey.core.mapper;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.monkey.core.dtos.*;
import com.monkey.core.entity.Order;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.monkey.core.entity.Payfor;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-13
 */
public interface OrderRepository extends BaseMapper<Order> {
    void updateOrderState(@Param("num") String num, @Param("orderState") Integer orderState, @Param("payState") Integer payState, @Param("backNum") String backNum);

    TodayStatical getOrderStatical(@Param("start") Date start, @Param("end") Date end);

    List<SalePercentDto> getTodaySalePercent(@Param("start") Date start, @Param("end") Date end);

    List<SalePercentDto> getMonthSalePercent(@Param("start") Date start, @Param("end") Date end);

    List<SalePercentDto> getPointSalePercent(@Param("start") Date start, @Param("end") Date end);

    List<SalePercentDto> getPayTypePercent(@Param("start") Date start, @Param("end") Date end);

    Payfor getPayforByOrder(@Param("appId") String appId, @Param("mch_id") String mch_id);

    Payfor getPayforByAppId(@Param("appId") String appId);

    List<DeviceSaleStatical> getDeviceSaleStatical(Pagination page, @Param("deviceName") String deviceName, @Param("pointName") String pointName, @Param("start") Date start, @Param("end") Date end);

    List<ProductSaleStatical> getProductSaleStatical(Pagination page,@Param("productName") String productName, @Param("deviceName") String deviceName, @Param("start") Date start, @Param("end") Date end);

}
