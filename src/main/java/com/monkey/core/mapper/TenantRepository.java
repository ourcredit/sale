package com.monkey.core.mapper;

import com.monkey.core.entity.Role;
import com.monkey.core.entity.Tenant;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.monkey.core.entity.User;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-31
 */
public interface TenantRepository extends BaseMapper<Tenant> {
        void insertTenantAdmin(User user);
        void insertTenantRole(List<Role> roles);
        void insertTenantMenus(@Param("tenantId")Integer tenantId,@Param("roleId")Integer roleId);
        void insertTenantAdminRoles(@Param("tenantId")Integer tenantId,@Param("userId")Integer userId);
        List<Role> selectTenantRoles(@Param("tenantId")Integer tenantId);
        void    deleteByTenantId(@Param("tenantId") Integer tenantId);
}
