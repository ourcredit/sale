package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Controls.ITenantService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.common.util.JWTUtil;
import com.monkey.core.dtos.NgUserModel;
import com.monkey.core.entity.Tenant;
import com.monkey.core.entity.User;
import com.monkey.web.annotation.Pass;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
@RequestMapping("api/tenant")
public class TenantController {
    @Autowired
    ITenantService _tenantService;

    @ApiOperation(value = "获取租户列表", notes = "租户列表")
    @RequestMapping(value = "", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._system._tenant.list})
    public PublicResult<Page<Tenant>> tenants(@RequestBody PagedAndFilterInputDto page) throws Exception {
        EntityWrapper<Tenant> filter = new EntityWrapper<>();
        filter = ComUtil.genderFilter(filter, page.where);
        Page<Tenant> res = _tenantService.selectPage(new Page<>(page.index, page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取租户详情", notes = "租户列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._system._tenant.first})
    public PublicResult<Tenant> Tenant(@PathVariable Integer id) throws Exception {
        Tenant m = _tenantService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }

    @ApiOperation(value = "添加租户", notes = "租户列表")
    @RequestMapping(value = "/insert", method = RequestMethod.PUT)
    @RequiresPermissions(value = {PermissionConst._system._tenant.modify})
    public PublicResult<Object> insert(@RequestBody Tenant model) throws Exception {
        if (model.getName().isEmpty() || model.getDisplayName().isEmpty())
            return new PublicResult<>(PublicResultConstant.FAILED, "请完善信息");
        Boolean r = _tenantService.insertOrUpdate(model);
        if (model.getId() != null) {
            _tenantService.insertTenantAdmin(model.getId());
        }
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "编辑租户", notes = "租户列表")
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @RequiresPermissions(value = {PermissionConst._system._tenant.modify})
    public PublicResult<Object> update(@RequestBody Tenant model) throws Exception {
        Boolean r = _tenantService.insertOrUpdate(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "删除租户", notes = "租户列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @RequiresPermissions(value = {PermissionConst._system._tenant.delete})
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception {
        Boolean r = _tenantService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "批量删除租户", notes = "租户列表")
    @RequestMapping(value = "/batch", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._system._tenant.batch})
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception {
        Boolean r = _tenantService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
}

