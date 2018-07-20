declare global {
  interface System {
    import(request: string): Promise<any>;
  }
  var System: System;
}
export const locking = {
  path: "/locking",
  name: "locking",
  component: () =>
    System.import("../components/lockscreen/components/locking-page.vue")
};
export const loginRouter = {
  path: "/",
  name: "login",
  meta: {
    title: "LogIn"
  },
  component: () => System.import("../views/login.vue")
};
export const otherRouters = {
  path: "/main",
  name: "main",
  permission: "",
  meta: { title: "管理页" },
  component:() => System.import("../views/main.vue") ,
  children: [
    {
      path: "home",
      meta: { title: "主页" },
      name: "home",
      component: () => System.import("../views/home/home.vue")
    },
    {
      path: "/dashboard",
      meta: { title: "控制台" },
      name: "dashboard",
      permission: "dashboard:show",
      component: () => System.import("../views/home/home.vue")
    }
  ]
};
export const appRouters = [
  {
    path: "/order",
    name: "order",
    meta: { title: "订单系统" },
    icon: "&#xe68a;",
    component: () => System.import("../views/main.vue") ,
    children: [
      {
        path: "list",
        meta: { title: "订单列表" },
        name: "ol",
        component: () => System.import("../views/setting/user/user.vue")
      },
      {
        path: "back",
        meta: { title: "退款单" },
        name: "back",
        component: () => System.import("../views/setting/role/role.vue")
      }
    ]
  },
  {
    path: "/pointer",
    name: "pointer",
    meta: { title: "点位管理" },
    icon: "&#xe68a;",
    component: () => System.import("../views/main.vue") ,
    children: [
      {
        path: "org",
        meta: { title: "机构树管理" },
        name: "org",
        component: () => System.import("../views/setting/user/user.vue")
      },
      {
        path: "point",
        meta: { title: "点位管理" },
        name: "point",
        component: () => System.import("../views/setting/role/role.vue")
      }
    ]
  },
  {
    path: "/product",
    name: "product",
    meta: { title: "货物管理" },
    icon: "&#xe68a;",
    component: () => System.import("../views/main.vue") ,
    children: [
      {
        path: "list",
        meta: { title: "商品管理" },
        name: "plist",
        component: () => System.import("../views/setting/user/user.vue")
      },
      {
        path: "box",
        meta: { title: "售货机管理" },
        name: "box",
        component: () => System.import("../views/setting/role/role.vue")
      }
    ]
  },
  {
    path: "/watch",
    name: "watch",
    meta: { title: "监控系统" },
    icon: "&#xe68a;",
    component: () => System.import("../views/main.vue") ,
    children: [
      {
        path: "action",
        meta: { title: "后台操作日志" },
        name: "action",
        component: () => System.import("../views/setting/user/user.vue")
      },
      {
        path: "run",
        meta: { title: "监控运行日志" },
        name: "run",
        component: () => System.import("../views/setting/role/role.vue")
      },
      {
        path: "error",
        meta: { title: "故障日志" },
        name: "error",
        component: () => System.import("../views/setting/role/role.vue")
      }
    ]
  },
  {
    path: "/report",
    name: "report",
    meta: { title: "报表系统" },
    icon: "&#xe68a;",
    component: () => System.import("../views/main.vue") ,
    children: [
      {
        path: "a",
        meta: { title: "a报表" },
        name: "a",
        component: () => System.import("../views/setting/user/user.vue")
      },
      {
        path: "b",
        meta: { title: "b报表" },
        name: "b",
        component: () => System.import("../views/setting/role/role.vue")
      }
     
    ]
  },
  {
    path: "/setting",
    name: "setting",
    permission: "system:list",
    meta: { title: "系统管理" },
    icon: "&#xe68a;",
    component: () => System.import("../views/main.vue") ,
    children: [
      {
        path: "user",
        permission: "user:list",
        meta: { title: "用户管理" },
        name: "user",
        component: () => System.import("../views/setting/user/user.vue")
      },
      {
        path: "role",
        permission: "role:list",
        meta: { title: "角色管理" },
        name: "role",
        component: () => System.import("../views/setting/role/role.vue")
      },
      {
        path: "menus",
        permission: "menu:list",
        meta: { title: "菜单管理" },
        name: "menus",
        component: () => System.import("../views/setting/menus/index.vue")
      }
    ]
  }
];
export const routers = [loginRouter, locking, ...appRouters, otherRouters];
