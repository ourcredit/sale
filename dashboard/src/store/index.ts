import Vue from "vue";
import Vuex from "vuex";
Vue.use(Vuex);
import app from "@/store/modules/app";
import session from "@/store/modules/session";
import account from "@/store/modules/account";
import user from "@/store/modules/user";
import role from "@/store/modules/role";
import log from "@/store/modules/log";
import menu from "@/store/modules/menus";
import point from "@/store/modules/point";
import device from "@/store/modules/device";
import product from "@/store/modules/product";
import tenant from "@/store/modules/tenant";
import order from "@/store/modules/order";
import dash from "@/store/modules/dash";
const store: any = new Vuex.Store({
  state: {
    //
  },
  mutations: {
    //
  },
  actions: {},
  modules: {
    app,
    session,
    account,
    user,
    role,
    log,
    menu,
    point,
    device,
    product,
    tenant,
    order,
    dash
  }
});

export default store;
