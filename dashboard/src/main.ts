import Vue from 'vue';
import App from './app.vue';
import iView from 'iview'
import { router } from './router/index';
//import 'iview/dist/styles/iview.css';
import 'famfamfam-flags/dist/sprite/famfamfam-flags.css';
import './theme.less';
Vue.use(iView);
//Vue.use(Vuex)
import store from './store/index';
Vue.config.productionTip = false
import { appRouters, otherRouters } from './router/router'
new Vue({
  render: h => h(App),
  router: router,
  store: store,
  data: {
    currentPageName: ''
  },
  async mounted() {
    this.currentPageName = this.$route.name as string;
    await this.$store.dispatch({
      type: 'session/init'
    })
    this.$store.commit('app/initCachepage');
    this.$store.commit('app/updateMenulist');
  },
  created() {
    let tagsList: Array<any> = [];
    appRouters.map((item) => {
      if (item.children.length <= 1) {
        tagsList.push(item.children[0]);
      } else {
        tagsList.push(...item.children);
      }
    });
    this.$store.commit('app/setTagsList', tagsList);
  }
}).$mount('#app')


