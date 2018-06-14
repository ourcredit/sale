package com.monkey.web.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Menus.IMenuService;
import com.monkey.application.Roles.IUserRoleService;
import com.monkey.application.Users.IUserService;
import com.monkey.common.base.Constant;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.common.util.JWTUtil;
import com.monkey.common.util.StringUtil;
import com.monkey.core.dtos.NgUserModel;
import com.monkey.core.dtos.UserDto;
import com.monkey.core.entity.User;
import com.monkey.core.entity.Userrole;
import com.monkey.web.annotation.Log;
import com.monkey.web.annotation.Pass;
import com.monkey.web.controller.dtos.UserLoginInput;
import com.monkey.web.controller.dtos.UserRegisterInput;
import io.swagger.annotations.ApiOperation;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  登录接口
 * @author liugh
 * @since 2018-05-03
 */
@RestController
@RequestMapping("/api/auth")
public class LoginController {
    private Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private IUserService _userService;

    @Log(description="登录接口:/login")
    @Pass
    @ApiOperation(value = "登录接口",notes = "登陆")
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public PublicResult<NgUserModel> login(@RequestBody UserLoginInput input) throws Exception{
        if (ComUtil.isEmpty(input.userName) || ComUtil.isEmpty(input.passWord)) {
            return new PublicResult<>(PublicResultConstant.PARAM_ERROR, null);
        }
        EntityWrapper<User> ew = new EntityWrapper<>();
        ew.where("account={0}", input.userName);
        User user = _userService.selectOne(ew);
        if (ComUtil.isEmpty(user) || !BCrypt.checkpw(input.passWord, user.getPassword())) {
            return new PublicResult<>(PublicResultConstant.INVALID_USERNAME_PASSWORD, null);
        }
        NgUserModel u= new NgUserModel(JWTUtil.sign(user.getUserName(), user.getPassword()),null );
        return new PublicResult<>(PublicResultConstant.SUCCESS, u);
    }
    @Log(description="注册接口:/register")
    @Pass
    @ApiOperation(value = "注册接口",notes = "注册新用户")
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public PublicResult<User> register(
                                       @RequestBody UserRegisterInput input,
                                       BindingResult error) {
        if (error.hasErrors()) {
            return new PublicResult<>(error.getAllErrors().get(0).getDefaultMessage(), null);
        }
        if(!StringUtil.checkMobileNumber(input.telephone)){
            return new PublicResult<>(PublicResultConstant.PARAM_ERROR, null);
        }
        if(!StringUtil.checkEmail(input.email)){
            return new PublicResult<>(PublicResultConstant.PARAM_ERROR, null);
        }
        if (!input.passWord.equals(input.rePassWord)) {
            return new PublicResult<>(PublicResultConstant.INVALID_RE_PASSWORD, null);
        }
        EntityWrapper<User> ew = new EntityWrapper<>();
        ew.where("account={0}", input.userName);
        List<User> userList = _userService.selectList(ew);
        if (! ComUtil.isEmpty(userList)) {
            return new PublicResult<>(PublicResultConstant.USERNAME_ALREADY_IN, null);
        }
        User users = new User( );
        boolean result = _userService.register(users, new ArrayList<Integer>(Constant.DEFAULT_REGISTER_ROLE));
        return result? new PublicResult<>(PublicResultConstant.SUCCESS, null):
                new PublicResult<>(PublicResultConstant.FAILED, null);
    }
}
