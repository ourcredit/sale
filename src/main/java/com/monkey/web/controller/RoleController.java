package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Menus.IRoleMenuService;
import com.monkey.application.Roles.IRoleService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.application.dtos.RoleMenuInput;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
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
    @Autowired
    IRoleMenuService _roleMenuService;

    // @Log(description="获取用户列表:/list")
    @ApiOperation(value = "获取角色列表", notes = "角色列表")
    @RequestMapping(value = "", method = RequestMethod.POST)
    @RequiresPermissions(value = {"role:list"})
    public PublicResult<Page<Role>> roles(@RequestBody PagedAndFilterInputDto page) throws Exception {
        EntityWrapper<Role> filter = new EntityWrapper<>();
        if (!page.filter.isEmpty()) {
            filter.eq("roleName", page.filter);
        }
        Page<Role> res = _roleService.selectPage(page.get_page(), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }

    @ApiOperation(value = "角色分配菜单", notes = "角色列表")
    @RequestMapping(value = "/rolemenu", method = RequestMethod.POST)
    @RequiresPermissions(value = {"user:alow"})
    public PublicResult<Object> allowroles(@RequestBody RoleMenuInput model) throws Exception {
        Boolean res = _roleMenuService.insertRoleMenu(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }

    @ApiOperation(value = "获取角色详情", notes = "角色列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @RequiresPermissions(value = {"role:list"})
    public PublicResult<Object> role(@PathVariable Integer id) throws Exception {
        Role r = _roleService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "添加或编辑角色", notes = "角色列表")
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @RequiresPermissions(value = {"role:add"})
    public PublicResult<Object> insert(@RequestBody Role model) throws Exception {
        Boolean r = _roleService.insertOrUpdate(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "删除角色", notes = "角色列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @RequiresPermissions(value = {"role:delete"})
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception {
        Boolean r = _roleService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "批量删除角色", notes = "角色列表")
    @RequestMapping(value = "/batch", method = RequestMethod.POST)
    @RequiresPermissions(value = {"user:delette"})
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception {
        Boolean r = _roleService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
}

