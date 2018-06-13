package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Roles.IUserRoleService;
import com.monkey.application.Users.IUserService;
import com.monkey.application.Users.dtos.CreateUserInput;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.application.dtos.UserRoleInput;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.dtos.UserDto;
import com.monkey.core.entity.User;
import com.monkey.web.annotation.CurrentUser;
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
 * @author liugh
 * @since 2018-05-03
 */
@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    IUserService _userService;
    @Autowired
    IUserRoleService _userRoleService;
   // @Log(description="获取用户列表:/list")
    @ApiOperation(value = "获取用户列表",notes = "用户列表")
    @RequestMapping(value = "",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._user.list})
    public PublicResult<Page<User>> users(@RequestBody PagedAndFilterInputDto page) throws Exception{
        EntityWrapper<User> filter = new EntityWrapper<User>();
        filter=  ComUtil.genderFilter(filter,page.where);
        Page<User> res= _userService.selectPage(new Page<>(page.index,page.size),filter);

        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取用户详情",notes = "用户列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._user.first})
    public PublicResult<UserDto>  user(@PathVariable Integer id) throws Exception{
        UserDto u=_userService.selectUserRole(id);
        PublicResult r= new PublicResult<>(PublicResultConstant.SUCCESS, u);
        return  r;
    }
    @ApiOperation(value = "获取当前登陆用户",notes = "用户列表")
    @RequestMapping(value = "/current",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._user.first})
    public PublicResult<UserDto>  user(@CurrentUser User current) throws Exception{
        UserDto u=_userService.selectUserRole(current.getId());
        PublicResult r= new PublicResult<>(PublicResultConstant.SUCCESS, u);
        return  r;
    }

    @ApiOperation(value = "添加或编辑用户",notes = "用户列表")
    @RequestMapping(value = "/modify",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._user.modify})
    public PublicResult<Object> modify(@RequestBody CreateUserInput model) throws Exception{
        _userService.ModifyUserAndRoles(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, true);
    }
    @ApiOperation(value = "用户分配角色",notes = "用户列表")
    @RequestMapping(value = "/userrole",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._user.userrole})
    public PublicResult<Object> allowroles(@RequestBody UserRoleInput model) throws Exception{
      Boolean res=  _userRoleService.insertUserRoles(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "删除用户",notes = "用户列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @RequiresPermissions(value = {PermissionConst._user.delete})
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception{
        Boolean res=  _userService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "批量删除用户",notes = "用户列表")
    @RequestMapping(value = "/batch",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._user.batch})
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception{
        Boolean res=_userService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
}

