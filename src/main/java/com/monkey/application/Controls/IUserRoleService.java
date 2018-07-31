package com.monkey.application.Roles;

import com.baomidou.mybatisplus.service.IService;
import com.monkey.application.dtos.UserRoleInput;
import com.monkey.core.entity.Userrole;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
public interface IUserRoleService extends IService<Userrole> {

    /**
     * 根据用户ID查询人员角色
     * @param userId 用户ID
     * @return  结果
     */
    List<Userrole> selectByUserId(Integer userId);
    Boolean  insertUserRoles(UserRoleInput input);
}
