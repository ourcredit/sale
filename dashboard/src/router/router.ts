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
  meta: { title: "管理页" },
  component: () => System.import("../views/main.vue"),
  children: [
    {
      path: "/dashboard",
      meta: { title: "首页" },
      name: "dashboard",
      permission: "dashboard:show",
      component: () => System.import("../views/home/dashboard.vue")
    },
    {
      path: "/allowproduct",
      meta: { title: "分配商品" },
      name: "allowproduct",
      permission: "device:allow",
      component: () => System.import("../views/devices/allow.vue")
    }
  ]
};
export const appRouters: Array<any> = [
  {
    path: "/order",
    name: "order",
    meta: { title: "订单系统" },
    permission: "order:show",
    icon: "&#xeb1c;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "list",
        meta: { title: "订单列表" },
        permission: "order:list",
        name: "ol",
        component: () => System.import("../views/orders/index.vue")
      },
      {
        path: "back",
        meta: { title: "退款单" },
        permission: "order:back",
        name: "back",
        component: () => System.import("../views/orders/payback.vue")
      }
    ]
  },
  {
    path: "/pointer",
    name: "pointer",
    meta: { title: "点位管理" },
    permission: "pointer:show",
    icon: "&#xeb33;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "point",
        meta: { title: "点位管理" },
        permission: "point:list",
        name: "point",
        component: () => System.import("../views/points/index.vue")
      },
      {
        path: "pointshow",
        meta: { title: "点位展示" },
        permission: "point:list",
        name: "pointshow",
        component: () => System.import("../views/points/show.vue")
      }
    ]
  },
  {
    path: "/device",
    name: "device",
    meta: { title: "设备管理" },
    permission: "devices:show",
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
    permission: "product:show",
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
    permission: "pay:setting",
    icon: "&#xeb18;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "settings",
        meta: { title: "支付设置" },
        permission: "pay:first",
        name: "ap",
        component: () => System.import("../views/payfor/index.vue")
      }
    ]
  },
  {
    path: "/watch",
    name: "watch",
    meta: { title: "监控系统" },
    permission: "watch:show",
    icon: "&#xeafa;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "action",
        meta: { title: "后台操作日志" },
        permission: "actionlog:list",
        name: "action",
        component: () => System.import("../views/actions/action.vue")
      },
      {
        path: "run",
        meta: { title: "监控运行日志" },
        permission: "runlog:list",
        name: "run",
        component: () => System.import("../views/actions/run.vue")
      },
      {
        path: "error",
        meta: { title: "故障日志" },
        permission: "errorlog:list",
        name: "error",
        component: () => System.import("../views/actions/error.vue")
      }
    ]
  },
  {
    path: "",
    name: "report",
    meta: { title: "报表系统" },
    permission: "report:show",
    icon: "&#xeaf5;",
    component: () => System.import("../views/main.vue"),
    children: [
      {
        path: "/report/device",
        meta: { title: "设备销量" },
        permission: "devicesale:list",
        name: "report.device",
        component: () => System.import("../views/report/device.vue")
      },
      {
        path: "/report/product",
        meta: { title: "产品销量" },
        permission: "productsale:list",
        name: "report.product",
        component: () => System.import("../views/report/product.vue")
      },
      {
        path: "/report/dgp",
        meta: { title: "设备备货" },
        permission: "deviceget:list",
        name: "report.dgp",
        component: () => System.import("../views/report/dgp.vue")
      },
      {
        path: "/report/de",
        meta: { title: "设备故障记录" },
        permission: "devicewarn:list",
        name: "report.de",
        component: () => System.import("../views/report/de.vue")
      },
      {
        path: "/report/dep",
        meta: { title: "设备故障率" },
        permission: "devicewarnper:list",
        name: "report.dep",
        component: () => System.import("../views/report/dep.vue")
      },
    ]
  },
  {
    path: "/setting",
    name: "setting",
    permission: "system:show",
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
        path: "category",
        permission: "category:list",
        meta: { title: "商品分类管理" },
        name: "category",
        component: () => System.import("../views/setting/category/index.vue")
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
