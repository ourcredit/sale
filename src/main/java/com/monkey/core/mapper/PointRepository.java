package com.monkey.core.mapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.monkey.core.entity.Point;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
public interface PointRepository extends BaseMapper<Point> {
    List<Point> selectbyAreaAndName(Pagination page, @Param("name")String name, @Param("code")String code);
    List<String> selectPointNameByTreeCode(@Param("code")String code);
    List<Integer> selectPointIdByTreeCode(@Param("code")String code);
}
