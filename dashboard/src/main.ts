import Vue from "vue";
import App from "./app.vue";
import iView from "iview";
import { router } from "@/router";
import BaiduMap from "vue-baidu-map";
// import "iview/dist/styles/iview.css";
import "famfamfam-flags/dist/sprite/famfamfam-flags.css";
import "./theme.less";
Vue.use(iView);
Vue.use(BaiduMap, {
  /* Visit http://lbsyun.baidu.com/apiconsole/key for details about app key. */
  ak: "pYjoSR2GThuatLt06MlaKzRgSWy4Zztq"
});
// vue.use(Vuex)
import store from "@/store";
Vue.config.productionTip = false;
import { appRouters, otherRouters } from "@/router/router";
new Vue({
  render: h => h(App),
  router: router,
  store: store,
  data: {
    currentPageName: ""
  },
  async mounted(): Promise<void> {
    this.currentPageName = this.$route.name as string;
    await this.$store.dispatch({
      type: "session/init"
    });
    this.$store.commit("app/initCachepage");
    this.$store.commit("app/updateMenulist");
  },
  created(): void {
    let tagsList: Array<any> = [];
    appRouters.map(item => {
      if (item.children.length <= 1) {
        tagsList.push(item.children[0]);
      } else {
        tagsList.push(...item.children);
      }
    });
    this.$store.commit("app/setTagsList", tagsList);
  }
}).$mount("#app");
