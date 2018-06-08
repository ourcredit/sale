declare global {
  interface System {
    import(request: string): Promise<any>;
  }
  var System: System;
}
import login from "../views/login.vue";
import home from "../views/home/home.vue";
import main from "../views/main.vue";
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
  meta: { title: "ManageMenu" },
  component: main,
  children: [
    {
      path: "home",
      meta: { title: "HomePage" },
      name: "home",
      component: () => System.import("../views/home/home.vue")
    }
  ]
};
export const appRouters = [
  {
    path: "/setting",
    name: "setting",
    permission: "",
    meta: { title: "系统管理" },
    icon: "&#xe68a;",
    component: main,
    children: [
      {
        path: "user",
        //permission: "Pages.Users",
        meta: { title: "用户管理" },
        name: "user",
        component: () => System.import("../views/setting/user/user.vue")
      },
      {
        path: "role",
       // permission: "Pages.Roles",
        meta: { title: "角色管理" },
        name: "role",
        component: () => System.import("../views/setting/role/role.vue")
      },
      {
        path: "menus",
       // permission: "Pages.Tenants",
        meta: { title: "菜单管理" },
        name: "menus",
        component: () => System.import("../views/setting/tenant/tenant.vue")
      }
    ]
  }
];
export const routers = [loginRouter, locking, ...appRouters, otherRouters];
