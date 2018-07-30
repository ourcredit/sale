import Vue from "vue";
import VueRouter from "vue-router";
import iView from "iview";
import Util from "@/lib/util";
import auth from "@/lib/auth";
import Cookies from "js-cookie";
import { routers,appRouters, otherRouters } from "@/router/router";
Vue.use(VueRouter);

const RouterConfig: any = {
  // mode: 'history',
  routes: routers
};

export const router: any = new VueRouter(RouterConfig);

router.beforeEach((to, from, next) => {
  iView.LoadingBar.start();
  Util.title(to.meta.title);
  var token: string = Cookies.get("Abp.AuthToken");
  if (Cookies.get("locking") === "1" && to.name !== "locking") {
    next({
      replace: true,
      name: "locking"
    });
  } else if (Cookies.get("locking") === "0" && to.name === "locking") {
    next(false);
  } else {
    if (!token && to.name !== "login") {
      next({
        name: "login"
      });
    } else if (!!token && to.name === "login") {
      Util.title(to.meta.title);
      next({
        name: "dashboard"
      });
    } else {
      const curRouterObj: any = Util.getRouterObjByName(
        [otherRouters, ...appRouters],
        to.name
      );
      if (curRouterObj && curRouterObj.permission) {
        if (
          auth.allPermissions[curRouterObj.permission] &&
          auth.grantedPermissions[curRouterObj.permission]
        ) {
          if (auth.hasPermission(curRouterObj.permission)) {
            Util.toDefaultPage(
              [otherRouters, ...appRouters],
              to.name,
              router,
              next
            );
          } else {
            next({
              replace: true,
              name: "error-403"
            });
          }
        } else {
          Util.toDefaultPage(
            [otherRouters, ...appRouters],
            to.name,
            router,
            next
          );
        }
      } else {
        Util.toDefaultPage([...routers], to.name, router, next);
      }
    }
  }
});
router.afterEach(to => {
  Util.openNewPage(router.app, to.name, to.params, to.query);
  iView.LoadingBar.finish();
  window.scrollTo(0, 0);
});
