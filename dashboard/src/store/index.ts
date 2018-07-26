import Vue from "vue";
import Vuex from "vuex";
Vue.use(Vuex);
import app from "./modules/app";
import session from "./modules/session";
import account from "./modules/account";
import user from "./modules/user";
import role from "./modules/role";
import log from "./modules/log";
import menu from "./modules/menus";
import point from "./modules/point";
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
    point
  }
});

export default store;
