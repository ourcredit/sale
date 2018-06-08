package com.monkey.common.base;


import java.util.ArrayList;
import java.util.List;

public interface InitConst {

    public static class _defaultUser {
        public static final String admin = "admin";
        public static final String def = "user";
        public static final String defaultPassword = "1234567";
    }

    public static class _defaultRole {
        public static final String admin = "admin";
        public static final String def = "default";
    }

    public static class _menu {
        public static List<MenuInfo> menuList = new ArrayList<MenuInfo>() {{
            add(new MenuInfo("系统管理", PermissionConst._system.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("用户管理", PermissionConst._user.list, "/system/user", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("添加用户", PermissionConst._user.modify, "", 2, null));
                    add(new MenuInfo("编辑用户", PermissionConst._user.modify, "", 2, null));
                    add(new MenuInfo("删除用户", PermissionConst._user.delete, "", 2, null));
                    add(new MenuInfo("批量删除用户", PermissionConst._user.batch, "", 2, null));
                    add(new MenuInfo("分配角色", PermissionConst._user.userrole, "", 2, null));
                    add(new MenuInfo("获取详情", PermissionConst._user.first, "", 2, null));

                }}));
                add(new MenuInfo("角色管理", PermissionConst._role.list, "/system/role", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("添加角色", PermissionConst._role.modify, "", 2, null));
                    add(new MenuInfo("编辑角色", PermissionConst._role.modify, "", 2, null));
                    add(new MenuInfo("删除角色", PermissionConst._role.delete, "", 2, null));
                    add(new MenuInfo("批量删除角色", PermissionConst._role.batch, "", 2, null));
                    add(new MenuInfo("分配菜单", PermissionConst._role.rolemenu, "", 2, null));

                }}));
                add(new MenuInfo("菜单管理", PermissionConst._menu.list, "/system/menu", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("添加菜单", PermissionConst._menu.modify, "", 2, null));
                    add(new MenuInfo("编辑菜单", PermissionConst._menu.modify, "", 2, null));
                    add(new MenuInfo("删除菜单", PermissionConst._menu.delete, "", 2, null));
                    add(new MenuInfo("批量删除菜单", PermissionConst._menu.batch, "", 2, null));
                }}));
                add(new MenuInfo("日志管理", PermissionConst._log.list, "/system/log", 1,  new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("添加日志", PermissionConst._log.modify, "", 2, null));
                    add(new MenuInfo("编辑日志", PermissionConst._log.modify, "", 2, null));
                    add(new MenuInfo("删除日志", PermissionConst._log.delete, "", 2, null));
                    add(new MenuInfo("批量删除日志", PermissionConst._log.batch, "", 2, null));
                }}));
            }}));
        }};

        public static class MenuInfo {
            public MenuInfo() {
            }
            public MenuInfo(String name, String code, String url, Integer type, List<MenuInfo> childs) {
                Name = name;
                Type = type;
                Code = code;
                Url = url;
                Children = childs;
            }

            public String Name;
            public String Code;
            public Integer Type;

            public String Url;
            public List<MenuInfo> Children;
        }
    }

}