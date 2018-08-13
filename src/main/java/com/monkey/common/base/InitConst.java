package com.monkey.common.base;


import java.util.ArrayList;
import java.util.List;

public interface InitConst {
    public static class _defaultTenant {
        public static final String admin = "default";
    }

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
            add(new MenuInfo("控制台", PermissionConst._dashboard.list, "/dashboard", 1, null));
            add(new MenuInfo("订单系统", PermissionConst._order.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("订单列表", PermissionConst._order.list, "/order/list", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("查看订单", PermissionConst._order.show, "", 2, null));
                    add(new MenuInfo("退款", PermissionConst._order.back, "", 2, null));
                }}));
            }}));
            add(new MenuInfo("点位管理", PermissionConst._pointer.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("点位列表", PermissionConst._pointer._point.list, "/pointer/point", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("编辑点位", PermissionConst._pointer._point.modify, "", 2, null));
                    add(new MenuInfo("删除点位", PermissionConst._pointer._point.delete, "", 2, null));
                    add(new MenuInfo("批量删除点位", PermissionConst._pointer._point.batch, "", 2, null));
                    add(new MenuInfo("获取详情", PermissionConst._pointer._point.first, "", 2, null));
                }}));
            }}));
            add(new MenuInfo("设备管理", PermissionConst._device.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("设备列表", PermissionConst._device.list, "/device/list", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("编辑设备", PermissionConst._device.modify, "", 2, null));
                    add(new MenuInfo("删除设备", PermissionConst._device.delete, "", 2, null));
                    add(new MenuInfo("批量删除设备", PermissionConst._device.batch, "", 2, null));
                    add(new MenuInfo("获取设备详情", PermissionConst._device.first, "", 2, null));
                    add(new MenuInfo("配置商品", PermissionConst._device.allow, "", 2, null));
                }}));
            }}));

            add(new MenuInfo("货物管理", PermissionConst._pm.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("商品管理", PermissionConst._pm._product.list, "/product/list", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("编辑商品", PermissionConst._pm._product.modify, "", 2, null));
                    add(new MenuInfo("删除商品", PermissionConst._pm._product.delete, "", 2, null));
                    add(new MenuInfo("批量删除商品", PermissionConst._pm._product.batch, "", 2, null));
                    add(new MenuInfo("获取详情", PermissionConst._pm._product.first, "", 2, null));
                }}));
            }}));
            add(new MenuInfo("支付配置", PermissionConst._pay.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("支付设置", PermissionConst._pay.first, "/pay/alipay", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("修改配置", PermissionConst._pay.modify, "", 2, null));
                }}));
            }}));
            add(new MenuInfo("监控系统", PermissionConst._pm.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("后台操作日志", PermissionConst._watch._actionlog.list, "/watch/action", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("删除日志", PermissionConst._watch._actionlog.delete, "", 2, null));
                    add(new MenuInfo("批量删除日志", PermissionConst._watch._actionlog.batch, "", 2, null));
                }}));
                add(new MenuInfo("监控运行日志", PermissionConst._watch._runlog.list, "/watch/run", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("删除日志", PermissionConst._watch._runlog.delete, "", 2, null));
                    add(new MenuInfo("批量删除日志", PermissionConst._watch._runlog.batch, "", 2, null));
                }}));
                add(new MenuInfo("售货机故障日志", PermissionConst._watch._errorlog.list, "/watch/error", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("删除日志", PermissionConst._watch._errorlog.delete, "", 2, null));
                    add(new MenuInfo("批量删除日志", PermissionConst._watch._errorlog.batch, "", 2, null));
                }}));
            }}));

            add(new MenuInfo("报表系统", PermissionConst._report.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("设备销量", PermissionConst._report._a.list, "/watch/device", 1, null));
                add(new MenuInfo("商品销量", PermissionConst._report._b.list, "/watch/product", 1, null));
                add(new MenuInfo("设备备货信息", PermissionConst._report._b.list, "/watch/dgp", 1, null));
                add(new MenuInfo("设备故障记录", PermissionConst._report._b.list, "/watch/de", 1, null));
                add(new MenuInfo("设备故障率", PermissionConst._report._b.list, "/watch/dep", 1, null));
            }}));

            add(new MenuInfo("系统管理", PermissionConst._system.list, "", 1, new ArrayList<MenuInfo>() {{
                add(new MenuInfo("用户管理", PermissionConst._system._user.list, "/system/user", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("编辑用户", PermissionConst._system._user.modify, "", 2, null));
                    add(new MenuInfo("删除用户", PermissionConst._system._user.delete, "", 2, null));
                    add(new MenuInfo("批量删除用户", PermissionConst._system._user.batch, "", 2, null));
                    add(new MenuInfo("获取详情", PermissionConst._system._user.first, "", 2, null));
                }}));
                add(new MenuInfo("角色管理", PermissionConst._system._role.list, "/system/role", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("编辑角色", PermissionConst._system._role.modify, "", 2, null));
                    add(new MenuInfo("删除角色", PermissionConst._system._role.delete, "", 2, null));
                    add(new MenuInfo("批量删除角色", PermissionConst._system._role.batch, "", 2, null));
                    add(new MenuInfo("获取详情", PermissionConst._system._role.first, "", 2, null));
                }}));
                add(new MenuInfo("租户管理", PermissionConst._system._tenant.list, "/system/tenant", 1, new ArrayList<MenuInfo>() {{
                    add(new MenuInfo("编辑租户", PermissionConst._system._tenant.modify, "", 2, null));
                    add(new MenuInfo("删除租户", PermissionConst._system._tenant.delete, "", 2, null));
                    add(new MenuInfo("批量删除租户", PermissionConst._system._tenant.batch, "", 2, null));
                    add(new MenuInfo("获取租户详情", PermissionConst._system._tenant.first, "", 2, null));
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