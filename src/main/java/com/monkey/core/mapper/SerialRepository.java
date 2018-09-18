package com.monkey.core.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.monkey.core.entity.Order;
import com.monkey.core.entity.Serial;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-09-12
 */
public interface SerialRepository extends BaseMapper<Serial> {
        void  insertBySql(Order order);
}
