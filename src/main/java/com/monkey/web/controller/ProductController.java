package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Device.IProductService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.entity.Product;
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
@RequestMapping("api/product")
public class ProductController {
    @Autowired
    IProductService _productService;
    @ApiOperation(value = "获取设备列表",notes = "设备列表")
    @RequestMapping(value = "",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._system._menu.list})
    public PublicResult<Page<Product>> devices(@RequestBody PagedAndFilterInputDto page) throws Exception{
        EntityWrapper<Product> filter = new EntityWrapper<>();
        filter=  ComUtil.genderFilter(filter,page.where);
        Page<Product> res= _productService.selectPage(new Page<>(page.index,page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取设备详情",notes = "设备列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._system._menu.first})
    public PublicResult<Product> Product(@PathVariable Integer id) throws Exception{
        Product m=_productService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }

    @ApiOperation(value = "添加或编辑设备",notes = "设备列表")
    @RequestMapping(method = RequestMethod.PUT)
    @RequiresPermissions(value = {PermissionConst._system._menu.modify})
    public PublicResult<Object> insert(@RequestBody Product model) throws Exception{
        Boolean r=_productService.insertOrUpdate(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "删除设备",notes = "设备列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @RequiresPermissions(value = {PermissionConst._system._menu.delete})
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception{
        Boolean r=_productService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "批量删除设备",notes = "设备列表")
    @RequestMapping(value = "/batch",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._system._menu.batch})
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception{
        Boolean r=_productService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
}

