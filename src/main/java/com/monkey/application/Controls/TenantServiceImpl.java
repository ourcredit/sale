package com.monkey.application.Controls;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Menus.IMenuService;
import com.monkey.application.Menus.IRoleMenuService;
import com.monkey.common.base.InitConst;
import com.monkey.core.entity.*;
import com.monkey.core.mapper.TenantRepository;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-31
 */
@Service
public class TenantServiceImpl extends ServiceImpl<TenantRepository, Tenant> implements ITenantService {

    @Autowired
    IUserService _userService;
    @Autowired
    TenantRepository _tenantRepository;
    @Autowired
    IRoleService _roleService;
    @Autowired
    IUserRoleService _userRoleService;
    @Autowired
    IMenuService _menuService;
    @Autowired
    IRoleMenuService _roleMenuService;


    @Override
    public void insertTenantAdmin(Integer tenantId) {
        User t=new User("admin","1234567","admin",1);
        t.setTenantId(tenantId);
         _tenantRepository.insertTenantAdmin(t);
         List<Role> roles=new ArrayList<Role>(){{
             add(new Role( InitConst._defaultRole.admin, InitConst._defaultRole.admin,1,0,tenantId));
             add(new Role(InitConst._defaultRole.def, InitConst._defaultRole.def,1,1,tenantId));
         }};
         _tenantRepository.insertTenantRole(roles);
        _tenantRepository.insertTenantAdminRoles(t.getTenantId(),t.getId());
        List<Role> rls=_tenantRepository.selectTenantRoles(t.getTenantId());
        if(rls.size()>0){
            for (int i = 0; i <rls.size() ; i++) {
                _tenantRepository.insertTenantMenus(t.getTenantId(),rls.get(i).getId());

            }
        }

    }


}
