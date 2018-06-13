package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import com.monkey.application.Menus.IMenuService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.entity.Menu;
import com.monkey.core.entity.User;
import com.monkey.web.annotation.CurrentUser;
import com.monkey.web.annotation.Log;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
@RestController
@RequestMapping("/api/menu")
@RequiresPermissions(value = {})
public class MenuController {
    @Autowired
    IMenuService _menuService;

     @Log(description="获取菜单列表:/list")
    @ApiOperation(value = "获取菜单列表",notes = "菜单列表")
    @RequestMapping(value = "",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._menu.list})
    public PublicResult<Page<Menu>> menus(@RequestBody PagedAndFilterInputDto page) throws Exception{
        EntityWrapper<Menu> filter = new EntityWrapper<>();
         filter=  ComUtil.genderFilter(filter,page.where);
        Page<Menu> res= _menuService.selectPage(new Page<>(page.index,page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取菜单详情",notes = "菜单列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._menu.first})
    public PublicResult<Menu> menu(@PathVariable Integer id) throws Exception{
        Menu m=_menuService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }
    @ApiOperation(value = "获取当前用户有权限访问的菜单",notes = "菜单列表")
    @RequestMapping(value = "/allowmenus",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._menu.list})
    public PublicResult<List<Menu>> menu(@CurrentUser User current) throws Exception{
        List<Menu> m=_menuService.findMenuByUserId(current.getId());
        return new PublicResult<List<Menu>>(PublicResultConstant.SUCCESS, m);
    }

    @ApiOperation(value = "添加或编辑菜单",notes = "菜单列表")
    @RequestMapping(value = "/modify",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._menu.modify})
    public PublicResult<Object> insert(@RequestBody Menu model) throws Exception{
        Boolean r=_menuService.insertOrUpdate(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "删除菜单",notes = "菜单列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @RequiresPermissions(value = {"menu:delete"})
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception{
        Boolean r=_menuService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "批量删除菜单",notes = "菜单列表")
    @RequestMapping(value = "/batch",method = RequestMethod.POST)
    @RequiresPermissions(value = {"user:delette"})
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception{
        Boolean r=_menuService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
}

