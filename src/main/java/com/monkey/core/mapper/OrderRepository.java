package com.monkey.core.mapper;

import com.monkey.core.entity.Order;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-13
 */
public interface OrderRepository extends BaseMapper<Order> {
    void updateOrderState(@Param("num")String num,@Param("state")Integer state);
}
