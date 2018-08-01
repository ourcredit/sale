declare global {
  interface ISystem {
    import(request: string): Promise<any>;
  }
  var System: ISystem;
}
export const locking: any = {
  path: "/locking",
  name: "locking",
  component: () =>
    System.import("../components/lockscreen/components/locking-page.vue")
};
export const loginRouter: any = {
  path: "/",
  name: "login",
  meta: {
    title: "LogIn"
  },
  component: () => System.import("../views/login.vue")
};
export const otherRouters: any = {
  path: "/main",
  name: "main",
  permission: "",
  meta: { title: "管理页" },
  component: () => System.import("../views/main.vue"),
  children: [
    {
      path: "/dashboard",
      meta: { title: "控制台" },
      name: "dashboard",
      permission: "dashboard:show",
      component: () => System.import("../views/home/dashboard.vue")
    },
    {
      path: "/allowproduct",
      meta: { title: "分配商品" },
      name: "allowproduct",
      permission: "product:allow",
      component: () => System.import("../views/devices/allow.vue")
    }
  ]
};
export const appRouters: Array<any> = [
  {
    path: "/order",
    name: "order",
    meta: { title: "订单系统" },
    icon: "&#xeb1c;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "list",
        meta: { title: "订单列表" },
        name: "ol",
        component: () => System.import("../views/orders/index.vue")
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
    icon: "&#xeb33;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "point",
        meta: { title: "点位管理" },
        name: "point",
        component: () => System.import("../views/points/index.vue")
      },
      {
        path: "pointshow",
        meta: { title: "点位展示" },
        name: "pointshow",
        component: () => System.import("../views/points/show.vue")
      }
    ]
  },
  {
    path: "/device",
    name: "device",
    meta: { title: "设备管理" },
    icon: "&#xeac8;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "list",
        meta: { title: "设备管理" },
        permission: "device:list",
        name: "dl",
        component: () => System.import("../views/devices/index.vue")
      }
    ]
  },
  {
    path: "/product",
    name: "product",
    meta: { title: "货物管理" },
    icon: "&#xeafc;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "list",
        meta: { title: "商品管理" },
        permission: "product:list",
        name: "pl",
        component: () => System.import("../views/products/index.vue")
      }
    ]
  },
  {
    path: "/pay",
    name: "pay",
    meta: { title: "支付配置" },
    icon: "&#xeb18;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "settings",
        meta: { title: "支付设置" },
        permission: "pay:list",
        name: "ap",
        component: () => System.import("../views/payfor/index.vue")
      }
    ]
  },
  {
    path: "/watch",
    name: "watch",
    meta: { title: "监控系统" },
    icon: "&#xeafa;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "action",
        meta: { title: "后台操作日志" },
        name: "action",
        component: () => System.import("../views/actions/action.vue")
      },
      {
        path: "run",
        meta: { title: "监控运行日志" },
        name: "run",
        component: () => System.import("../views/actions/run.vue")
      },
      {
        path: "error",
        meta: { title: "故障日志" },
        name: "error",
        component: () => System.import("../views/actions/error.vue")
      }
    ]
  },
  {
    path: "/report",
    name: "report",
    meta: { title: "报表系统" },
    icon: "&#xeaf5;",
    component: () => System.import("../views/main.vue"),
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
    icon: "&#xeacc;",
    component: () => System.import("../views/main.vue"),
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
        path: "tenant",
         permission: "tenant:list",
        meta: { title: "运营商管理" },
        name: "tenant",
        component: () => System.import("../views/setting/tenants/index.vue")
      }
    ]
  }
];
export const routers: Array<any> = [
  loginRouter,
  locking,
  ...appRouters,
  otherRouters
];
