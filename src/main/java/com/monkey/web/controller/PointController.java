package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Device.IPointService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.entity.Point;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@RestController
@RequestMapping("api/point")
public class PointController {
    @Autowired
    IPointService _pointService;
    @ApiOperation(value = "获取点位列表",notes = "点位列表")
    @RequestMapping(value = "",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._pointer._point.list})
    public PublicResult<Page<Point>> devices(@RequestBody PagedAndFilterInputDto page) throws Exception{
        String name=  page.where.get("mame").toString();
        String code=  page.where.get("code").toString();
        Page<Point> res= _pointService.selectByAreaId(new Page<>(page.index,page.size), name,code);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取点位详情",notes = "点位列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._pointer._point.first})
    public PublicResult<Point> Point(@PathVariable Integer id) throws Exception{
        Point m=_pointService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }
    @ApiOperation(value = "添加或编辑点位",notes = "点位列表")
    @RequestMapping(method = RequestMethod.PUT)
    @RequiresPermissions(value = {PermissionConst._pointer._point.modify})
    public PublicResult<Object> insert(@RequestBody Point model) throws Exception{
        Boolean r=_pointService.insertOrUpdate(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "删除点位",notes = "点位列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @RequiresPermissions(value = {PermissionConst._pointer._point.delete})
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception{
        Boolean r=_pointService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "批量删除点位",notes = "点位列表")
    @RequestMapping(value = "/batch",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._pointer._point.batch})
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception{
        Boolean r=_pointService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
}
