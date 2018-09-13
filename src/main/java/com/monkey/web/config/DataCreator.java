package com.monkey.web.config;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Controls.ITenantService;
import com.monkey.application.Device.ITreeService;
import com.monkey.application.Menus.IMenuService;
import com.monkey.application.Menus.IRoleMenuService;
import com.monkey.application.Controls.IRoleService;
import com.monkey.application.Controls.IUserRoleService;
import com.monkey.application.Controls.IUserService;
import com.monkey.common.base.InitConst;
import com.monkey.core.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
public class DataCreator implements CommandLineRunner {

    @Autowired
    private Environment env;
    @Autowired
    IUserService _userService;
    @Autowired
    IRoleService _roleService;
    @Autowired
    IMenuService _menuService;
    @Autowired
    ITenantService _tenantService;
    @Autowired
    IUserRoleService _userRoleService;
    @Autowired
    IRoleMenuService _roleMenuService;
    @Autowired
    ITreeService _treeService;

    /**
     * 初始化数据结构
     */
    @Override
    public void run(String... strings) throws Exception {
        String r = env.getProperty("isInitData");
        if (r.equals("true")) {
            createDefaultTree();
            createDefaultTenant();
            createUserRoles();
            createRoleMenus();
        }
    }
    public  void  createDefaultTree(){
        EntityWrapper<Tree> ew = new EntityWrapper<>();
        ew.eq("name","未分配设备");
        Tree  t = _treeService.selectOne(ew);
        if(t==null){
            _treeService.insert(new Tree("未分配设备",null,null));
        }
    }
    public void  createDefaultTenant(){
        EntityWrapper<Tenant> ew = new EntityWrapper<>();
        ew.eq("tenantName",InitConst._defaultTenant.admin);
        Tenant  t = _tenantService.selectOne(ew);
        if(t==null){
         _tenantService.insert(new Tenant(InitConst._defaultTenant.admin,InitConst._defaultTenant.admin));
        }
    }
    public void createUserRoles() {
        EntityWrapper<User> ew = new EntityWrapper<>();
        ew.eq("account", InitConst._defaultUser.admin);
        User u = _userService.selectOne(ew);
        if (u == null) {
            Boolean b = _userService.insert(new User(InitConst._defaultUser.admin,
                    InitConst._defaultUser.defaultPassword,
                    InitConst._defaultUser.admin, 1));
            if (b) {
                u = _userService.selectOne(ew);
            }
        }
        EntityWrapper<Role> rw = new EntityWrapper<>();
        rw.eq("roleName", InitConst._defaultRole.admin);
        Role r = _roleService.selectOne(rw);
        if (r == null) {
            Boolean b = _roleService.insert(new Role( InitConst._defaultRole.admin, InitConst._defaultRole.admin,1,0));
            if (b) {
                r = _roleService.selectOne(rw);
            }
        }
        rw = new EntityWrapper<>();
        rw.eq("roleName", InitConst._defaultRole.def);
        Role de = _roleService.selectOne(rw);
        if (de == null) {
            Boolean b = _roleService.insert(new Role(InitConst._defaultRole.def, InitConst._defaultRole.def,1,1));
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

    public void createRoleMenus() {
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
