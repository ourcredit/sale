package com.monkey.application.Controls;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Menus.IMenuService;
import com.monkey.application.Menus.IRoleMenuService;
import com.monkey.common.base.InitConst;
import com.monkey.core.entity.*;
import com.monkey.core.mapper.TenantRepository;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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
    IRoleService _roleService;
    @Autowired
    IUserRoleService _userRoleService;
    @Autowired
    IMenuService _menuService;
    @Autowired
    IRoleMenuService _roleMenuService;
    @Override
    public void createTenantAndUserRoles(Integer tenantId) {
        createUserRoles(tenantId);
        createRoleMenus(tenantId);
    }
    public void createUserRoles(Integer tenantId) {
        User u=new User(InitConst._defaultUser.admin,
                InitConst._defaultUser.defaultPassword,
                InitConst._defaultUser.admin, 1) ;
           _userService.insert(u);
        EntityWrapper<Role> rw = new EntityWrapper<>();
        rw.eq("roleName", InitConst._defaultRole.admin);
        Role r = _roleService.selectOne(rw);
        if (r == null) {
            Boolean b = _roleService.insert(new Role(null, InitConst._defaultRole.admin, InitConst._defaultRole.admin,1,0));
            if (b) {
                r = _roleService.selectOne(rw);
            }
        }
        rw = new EntityWrapper<>();
        rw.eq("roleName", InitConst._defaultRole.def);
        Role de = _roleService.selectOne(rw);
        if (de == null) {
            Boolean b = _roleService.insert(new Role(null,InitConst._defaultRole.def, InitConst._defaultRole.def,1,1));
            if (b) {
                de = _roleService.selectOne(rw);
            }
        }
        List<Userrole> rels = new ArrayList<>();
        rels.add(new Userrole(u.getId(), r.getId()));
        rels.add(new Userrole(u.getId(), de.getId()));
        _userRoleService.delete(new EntityWrapper<>());
        _userRoleService.insertBatch(rels);
    }

    public void createRoleMenus(Integer tenantId) {
        List<InitConst._menu.MenuInfo> list = InitConst._menu.menuList;
        insertMenu(list, null);
        EntityWrapper e = new EntityWrapper<>();
        Role r = _roleService.selectOne(e.eq("roleName", InitConst._defaultRole.admin));
        if (r != null) {
            List<Menu> lists = _menuService.selectList(new EntityWrapper<>());
            List<Rolemenu> rms = new ArrayList<>();
            for (Menu m : lists) {
                rms.add(new Rolemenu(r.getId(), m.getId()));
            }
            _roleMenuService.insertBatch(rms);
        }
    }

    public void insertMenu(List<InitConst._menu.MenuInfo> list, Integer parentId) {
        EntityWrapper  e ;
        for (InitConst._menu.MenuInfo item : list) {
            e = new EntityWrapper<>();
            e.eq("name", item.Name);
            Menu m = _menuService.selectOne(e);
            if (m == null) {
                m = new Menu(item.Name, item.Code, item.Url, item.Type, parentId);
                Boolean r = _menuService.insert(m);
                if (r) {
                    m = _menuService.selectOne(e);
                }
            }
            if (item.Children!=null&& !item.Children.isEmpty()) {
                List<InitConst._menu.MenuInfo> a = new ArrayList<>();
                List<Menu> b = new ArrayList<>();
                for (InitConst._menu.MenuInfo t : item.Children) {
                    if (t.Type == 1) {
                        a.add(t);
                    } else {
                        b.add(new Menu(t.Name, t.Code, t.Url, t.Type, m.getId()));
                    }
                }
                if(!b.isEmpty()){
                    _menuService.insertBatch(b);
                }
                if (!a.isEmpty()) {
                    insertMenu(item.Children, m.getId());
                }
            }
        }

    }
}
