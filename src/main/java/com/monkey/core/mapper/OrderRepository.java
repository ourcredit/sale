package com.monkey.core.mapper;

import com.monkey.core.dtos.OrderStaticialDto;
import com.monkey.core.dtos.SalePercentDto;
import com.monkey.core.dtos.TodayStatical;
import com.monkey.core.entity.Order;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-13
 */
public interface OrderRepository extends BaseMapper<Order> {
    void updateOrderState(@Param("num")String num,@Param("orderState")Integer orderState,@Param("payState")Integer payState);
    TodayStatical getOrderStatical(@Param("start") Date start, @Param("end")Date end);
    List<SalePercentDto> getTodaySalePercent(@Param("start") Date start, @Param("end")Date end);
    List<SalePercentDto> getMonthSalePercent(@Param("start") Date start, @Param("end")Date end);
    List<SalePercentDto> getPointSalePercent(@Param("start") Date start, @Param("end")Date end);
    List<SalePercentDto> getPayTypePercent(@Param("start") Date start, @Param("end")Date end);

}
