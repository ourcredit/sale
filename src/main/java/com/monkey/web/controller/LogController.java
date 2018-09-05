package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import com.monkey.application.OperationLogs.IOperationLogService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.entity.Log;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Type;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 操作日志 前端控制器
 * </p>
 *
 * @author liugh123
 * @since 2018-05-08
 */
@RestController
@RequestMapping("/api/log")
public class LogController {
    @Autowired
    IOperationLogService _logService;

    // @Log(description="获取用户列表:/list")
    @ApiOperation(value = "获取日志列表",notes = "日志列表")
    @RequestMapping(value = "",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._watch._actionlog.list})
    public PublicResult<Page<Log>> logs(@RequestBody PagedAndFilterInputDto page) throws Exception{
        EntityWrapper<Log> filter = new EntityWrapper<>();
      filter=  ComUtil.genderFilter(filter,page.where);

        Page<Log> res= _logService.selectPage(new Page<>(page.index,page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取日志详情",notes = "日志列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._watch._actionlog.first})
    public PublicResult<Object> log(@PathVariable String id) throws Exception{
        Log l=_logService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, l);
    }
    @ApiOperation(value = "删除日志",notes = "日志列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @RequiresPermissions(value = {PermissionConst._watch._actionlog.delete})
    public PublicResult<Object> delete(@PathVariable String id) throws Exception{
        Boolean r=_logService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "批量删除日志",notes = "日志列表")
    @RequestMapping(value = "/batch",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._watch._actionlog.batch})
    public PublicResult<Object> batchdelete(@RequestBody List<String> ids) throws Exception{
        Boolean r=_logService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
}

