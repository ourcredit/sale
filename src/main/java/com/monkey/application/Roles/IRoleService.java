package com.monkey.application.Roles;

import com.baomidou.mybatisplus.service.IService;
import com.monkey.core.dtos.RoleDto;
import com.monkey.core.entity.Role;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
public interface IRoleService extends IService<Role> {
    RoleDto selectRoleAndPermissionsById(Integer id);
    Boolean insertRoleAndPermissions(RoleDto model);
    List<String> getAllPermissions();
}
