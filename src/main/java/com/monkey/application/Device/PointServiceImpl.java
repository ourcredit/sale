package com.monkey.application.Device;

import com.baomidou.mybatisplus.enums.SqlLike;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.monkey.core.entity.Point;
import com.monkey.core.entity.Tree;
import com.monkey.core.mapper.PointRepository;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.mapper.TreeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@Service
public class PointServiceImpl extends ServiceImpl<PointRepository, Point> implements IPointService {

    @Autowired
    PointRepository _pointRepository;
    @Autowired
    TreeRepository _treeRepository;

    @Override
    public Page<Point> selectByAreaId(Pagination page, String name, String areaId) {
        Page<Point> p = new Page<>();
        List<Point> r = _pointRepository.selectbyAreaAndName(page, name, areaId);
        p.setRecords(r);
        p.setTotal(page.getTotal());
        return p;
    }

    @Override
    public List<String> selectPointNameByCode(String code) {
     return  _pointRepository.selectPointNameByTreeCode(code);
    }

    @Override
    public List<Integer> selectPointIdsByCode(String code) {
        return  _pointRepository.selectPointIdByTreeCode(code);
    }
}
