package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Roles.IRoleService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.dtos.RoleDto;
import com.monkey.core.entity.Role;
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
 * @author liugh
 * @since 2018-05-03
 */
@RestController
@RequestMapping("/api/role")
public class RoleController {

    @Autowired
    IRoleService _roleService;


    // @Log(description="获取用户列表:/list")
    @ApiOperation(value = "获取角色列表", notes = "角色列表")
    @RequestMapping(value = "", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._system._role.list})
    public PublicResult<Page<Role>> roles(@RequestBody PagedAndFilterInputDto page) throws Exception {
        EntityWrapper<Role> filter = new EntityWrapper<>();
        filter=  ComUtil.genderFilter(filter,page.where);
        Page<Role> res = _roleService.selectPage(new Page<>(page.index,page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取角色详情", notes = "角色列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._system._role.first})
    public PublicResult<Object> role(@PathVariable Integer id) throws Exception {
        RoleDto r = _roleService.selectRoleAndPermissionsById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "添加或编辑角色", notes = "角色列表")
    @RequestMapping( method = RequestMethod.PUT)
    @RequiresPermissions(value = {PermissionConst._system._role.modify})
    public PublicResult<Object> insert(@RequestBody RoleDto model) throws Exception {
        Boolean r = _roleService.insertRoleAndPermissions(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "删除角色", notes = "角色列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @RequiresPermissions(value = {PermissionConst._system._role.delete})
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception {
        Boolean r = _roleService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "批量删除角色", notes = "角色列表")
    @RequestMapping(value = "/batch", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._system._role.batch})
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception {
        Boolean r = _roleService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
}

