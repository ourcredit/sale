import { appRouters, otherRouters } from "@/router/router";
import Util from "@/lib/util";
import auth from "@/lib/auth";
import Vue from "vue";
import { Store, Module, ActionContext } from "vuex";
import Vuex from "vuex";
import ajax from "@/lib/ajax";
import appconst from "@/lib/appconst";
import { debug } from "util";
Vue.use(Vuex);
interface IAppState {
  cachePage: Array<any>;
  lang: string;
  isFullScreen: boolean;
  openedSubmenuArr: Array<any>;
  menuTheme: string;
  themeColor: string;
  pageOpenedList: Array<any>;
  currentPageName: string;
  currentPath: Array<any>;
  menuList: Array<any>;
  routers: Array<any>;
  tagsList: Array<any>;
  messageCount: number;
  dontCache: Array<any>;
  noticeList: Array<any>;
}
class AppModule implements Module<IAppState, any> {
  namespaced = true;
  state = {
    cachePage: [],
    lang: "",
    isFullScreen: false,
    openedSubmenuArr: [],
    menuTheme: "dark",
    themeColor: "",
    pageOpenedList: [
      {
        meta: {
          title: "首页"
        },
        path: "",
        name: "dashboard"
      }
    ],
    currentPageName: "",
    currentPath: [
      {
        meta: {
          title: "首页"
        },
        path: "",
        name: "dashboard"
      }
    ],
    menuList: [],
    routers: [otherRouters, ...appRouters],
    tagsList: [...otherRouters.children],
    messageCount: 0,
    dontCache: [],
    noticeList: [
      {
        read: false,
        type: 0,
        title: "一个提示",
        description: "一天前"
      },
      {
        read: false,
        type: 1,
        title: "一个提示",
        description: "一天前"
      },
      {
        read: false,
        type: 0,
        title: "第二个提示",
        description: "一个月前"
      }
    ]
  };
  mutations = {
    logout(state: IAppState): void {
      localStorage.clear();
      sessionStorage.clear();
    },
    setTagsList(state: IAppState, list: Array<any>): void {
      state.tagsList.push(...list);
    },
    updateMenulist(state: IAppState): void {
      let menuList: Array<any> = [];
      appRouters.forEach((item: any, index) => {
        if (item.permission !== undefined) {
          let childrenArr: Array<any> = [];
          childrenArr = item.children.filter((child: any) => {
            let childany: any = child as any;
            if (childany.permission !== undefined) {
              if (auth.hasPermission(childany.permission)) {
                return child;
              }
            } else {
              return child;
            }
          });
          if (childrenArr.length > 0) {
            item.children = childrenArr;
            menuList.push(item);
          }
        } else {
          if (item.children.length === 1) {
            menuList.push(item);
          } else {
            let len: number = menuList.push(item);
            let childrenArr: Array<any> = [];
            childrenArr = item.children.filter((child: any) => {
              return child;
            });
            let handledItem: any = JSON.parse(
              JSON.stringify(menuList[len - 1])
            );
            handledItem.children = childrenArr;
            menuList.splice(len - 1, 1, handledItem);
          }
        }
      });
      state.menuList = menuList;
    },
    changeMenuTheme(state: IAppState, theme: string): void {
      state.menuTheme = theme;
    },
    changeMainTheme(state: IAppState, mainTheme: string): void {
      state.themeColor = mainTheme;
    },
    addOpenSubmenu(state: IAppState, name: any): void {
      let hasThisName: boolean = false;
      let isEmpty: boolean = false;
      if (name.length === 0) {
        isEmpty = true;
      }
      if (state.openedSubmenuArr.indexOf(name) > -1) {
        hasThisName = true;
      }
      if (!hasThisName && !isEmpty) {
        state.openedSubmenuArr.push(name);
      }
    },
    closePage(state: IAppState, name: any): void {
      state.cachePage.forEach((item, index) => {
        if (item === name) {
          state.cachePage.splice(index, 1);
        }
      });
    },
    initCachepage(state: IAppState): void {
      if (localStorage.cachePage) {
        state.cachePage = JSON.parse(localStorage.cachePage);
      }
    },
    removeTag(state: IAppState, name: string): void {
      state.pageOpenedList.map((item, index) => {
        if (item.name === name) {
          state.pageOpenedList.splice(index, 1);
        }
      });
    },
    pageOpenedList(state: IAppState, get: any): void {
      let openedPage: any = state.pageOpenedList[get.index];
      if (get.argu) {
        openedPage.argu = get.argu;
      }
      if (get.query) {
        openedPage.query = get.query;
      }
      state.pageOpenedList.splice(get.index, 1, openedPage);
      localStorage.pageOpenedList = JSON.stringify(state.pageOpenedList);
    },
    clearAllTags(state: IAppState): void {
      state.pageOpenedList.splice(1);
      state.cachePage.length = 0;
      localStorage.pageOpenedList = JSON.stringify(state.pageOpenedList);
    },
    clearOtherTags(state: IAppState, vm: Vue): void {
      let currentName: any = vm.$route.name;
      let currentIndex: number = 0;
      state.pageOpenedList.forEach((item, index) => {
        if (item.name === currentName) {
          currentIndex = index;
        }
      });
      if (currentIndex === 0) {
        state.pageOpenedList.splice(1);
      } else {
        state.pageOpenedList.splice(currentIndex + 1);
        state.pageOpenedList.splice(1, currentIndex - 1);
      }
      let newCachepage: any[] = state.cachePage.filter(item => {
        return item === currentName;
      });
      state.cachePage = newCachepage;
      localStorage.pageOpenedList = JSON.stringify(state.pageOpenedList);
    },
    setOpenedList(state: IAppState): void {
      state.pageOpenedList = localStorage.pageOpenedList
        ? JSON.parse(localStorage.pageOpenedList)
        : [otherRouters.children[0]];
    },
    setCurrentPath(state: IAppState, pathArr: Array<any>): void {
      state.currentPath = pathArr;
    },
    setCurrentPageName(state: IAppState, name: string): void {
      state.currentPageName = name;
    },
    clearOpenedSubmenu(state: IAppState): void {
      state.openedSubmenuArr.length = 0;
    },
    increateTag(state: IAppState, tagObj: any): void {
      if (!Util.oneOf(tagObj.name, state.dontCache)) {
        state.cachePage.push(tagObj.name);
        localStorage.cachePage = JSON.stringify(state.cachePage);
      }
      state.pageOpenedList.push(tagObj);
    }
  };
  actions = {
    async login(
      content: ActionContext<IAppState, any>,
      payload: any
    ): Promise<any> {
      let rep: any = await ajax.post("/api/auth/login", payload.data);
      var tokenExpireDate: any = payload.data.rememberMe
        ? new Date(new Date().getTime() + 1000 * 24 * 60 * 60)
        : undefined;
      auth.setToken(rep.data.token, tokenExpireDate);
    }
  };
}
const appModule: AppModule = new AppModule();
export default appModule;
