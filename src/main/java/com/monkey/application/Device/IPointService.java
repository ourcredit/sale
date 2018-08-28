package com.monkey.application.Device;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.monkey.core.entity.Point;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
public interface IPointService extends IService<Point> {
    List<Point> selectByAreaId(Pagination page, String name, String areaId);
}
