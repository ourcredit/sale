package com.monkey.core.mapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.monkey.core.entity.Point;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
public interface PointRepository extends BaseMapper<Point> {
    Page<Point> selectbyAreaAndName(Pagination page, @Param("name")String name, @Param("areaId")String areaId);
}
