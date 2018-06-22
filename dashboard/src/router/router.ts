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
    }
  ]
};
export const appRouters = [
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
        path: "test",
        permission: "user:list",
        meta: { title: "table组件测试" },
        name: "test",
        component: () => System.import("../views/setting/test/test.vue")
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
      ,
      {
        path: "logs",
        permission: "log:list",
        meta: { title: "日志管理" },
        name: "logs",
        component: () => System.import("../views/setting/operatelog/index.vue")
      }
    ]
  }
];
export const routers = [loginRouter, locking, ...appRouters, otherRouters];
