package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Payfor.ISerialService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.entity.Serial;
import com.monkey.web.annotation.Log;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.List;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@RestController
@RequestMapping("api/serial")
public class SerialController {
    @Autowired
    ISerialService _serialService;

    @ApiOperation(value = "获取流水信息列表", notes = "流水信息列表")
    @RequestMapping(value = "", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._report._serial.list})
    public PublicResult<Page<Serial>> pagecategorys(@RequestBody PagedAndFilterInputDto page) throws Exception {
        EntityWrapper<Serial> filter = new EntityWrapper<>();
        filter = ComUtil.genderFilter(filter, page.where);
        Page<Serial> res = _serialService.selectPage(new Page<>(page.index, page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }

    @ApiOperation(value = "获取流水信息详情", notes = "流水信息列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._report._serial.list})
    public PublicResult<Serial> Category(@PathVariable String id) throws Exception {
        Serial m = _serialService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }

}
