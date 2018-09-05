package com.monkey.application.Controls;

import com.baomidou.mybatisplus.service.IService;
import com.monkey.application.Controls.dtos.CreateUserInput;
import com.monkey.core.dtos.UserDto;
import com.monkey.core.entity.User;


import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
public interface IUserService extends IService<User> {

    /**
     * 根据用户名查询用户
     *
     * @param username 用户名
     * @return 用户
     */
    User getUserByUserName(String username,Integer tenantId);
    User login(String tenantName,String account);
    /**
     * <p>
     * 注册
     * </p>
     *
     * @param user  用户
     * @param roles 角色ids
     * @since 2018-05-03
     */
    boolean register(User user, List<Integer> roles);

    void ModifyUserAndRoles(CreateUserInput input);

    UserDto selectUserRole(Integer id);

}
