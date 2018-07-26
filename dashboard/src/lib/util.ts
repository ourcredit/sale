import Vue from "vue";
class Util {
  abp: any = window.abp;
  loadScript(url: string) {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = url;
    document.body.appendChild(script);
  }
  title(title: string) {
    let appname = "猿人";
    let page = "烘干机";
    window.document.title = appname + "⭐" + page;
  }
  inOf(arr: Array<any>, targetArr: any) {
    let res = true;
    arr.forEach(item => {
      if (targetArr.indexOf(item) < 0) {
        res = false;
      }
    });
    return res;
  }
  oneOf(ele: any, targetArr: Array<any>) {
    if (targetArr.indexOf(ele) >= 0) {
      return true;
    } else {
      return false;
    }
  }
  showThisRoute(itAccess: any, currentAccess: any) {
    if (typeof itAccess === "object" && Array.isArray(itAccess)) {
      return this.oneOf(currentAccess, itAccess);
    } else {
      return itAccess === currentAccess;
    }
  }
  getRouterObjByName(routers: Array<any>, name?: string): any {
    if (!name || !routers || !routers.length) {
      return null;
    }
    // debugger;
    let routerObj = null;
    for (let item of routers) {
      if (item.name === name) {
        return item;
      }
      routerObj = this.getRouterObjByName(item.children, name);
      if (routerObj) {
        return routerObj;
      }
    }
    return null;
  }
  toDefaultPage(
    routers: Array<any>,
    name: string | undefined,
    route: any,
    next: any
  ) {
    let len = routers.length;
    let i = 0;
    let notHandle = true;
    while (i < len) {
      if (
        routers[i].name === name &&
        routers[i].children &&
        routers[i].redirect === undefined
      ) {
        route.replace({
          name: routers[i].children[0].name
        });
        notHandle = false;
        next();
        break;
      }
      i++;
    }
    if (notHandle) {
      next();
    }
  }
  handleTitle(vm: any, item: any) {
    if (typeof item.meta.title === "object") {
      return vm.$t(item.title.i18n);
    } else {
      return item.meta.title;
    }
  }
  setCurrentPath(vm: Vue, name?: string) {
    let title = "";
    let isOtherRouter = false;
    vm.$store.state.app.routers.forEach((item: any) => {
      if (item.children.length === 1) {
        if (item.children[0].name === name) {
          title = this.handleTitle(vm, item);
          if (item.name === "otherRouter") {
            isOtherRouter = true;
          }
        }
      } else {
        item.children.forEach((child: any) => {
          if (child.name === name) {
            title = this.handleTitle(vm, child);
            if (item.name === "otherRouter") {
              isOtherRouter = true;
            }
          }
        });
      }
    });
    let currentPathArr = [];
    if (name === "home") {
      currentPathArr = [
        {
          meta: {
            title: this.handleTitle(
              vm,
              this.getRouterObjByName(vm.$store.state.app.routers, "home")
            )
          },
          path: "main/home",
          name: "home"
        }
      ];
    } else if (
      ((name as string).indexOf("index") >= 0 || isOtherRouter) &&
      name !== "home"
    ) {
      currentPathArr = [
        {
          meta: {
            title: this.handleTitle(
              vm,
              this.getRouterObjByName(vm.$store.state.app.routers, "home")
            )
          },
          path: "main/home",
          name: "home"
        },
        {
          meta: { title: title },
          path: "",
          name: name
        }
      ];
    } else {
      let currentPathObj = vm.$store.state.app.routers.filter((item: any) => {
        if (item.children.length <= 1) {
          return item.children[0].name === name || item.name === name;
        } else {
          let i = 0;
          let childArr = item.children;
          let len = childArr.length;
          while (i < len) {
            if (childArr[i].name === name) {
              return true;
            }
            i++;
          }
          return false;
        }
      })[0];
      if (
        currentPathObj.children &&
        currentPathObj.children.length <= 1 &&
        currentPathObj.name === "home"
      ) {
        currentPathArr = [
          {
            meta: { title: "首页" },
            path: "main/home",
            name: "home"
          }
        ];
      } else if (
        currentPathObj.children &&
        currentPathObj.children.length <= 1 &&
        currentPathObj.name !== "home"
      ) {
        currentPathArr = [
          {
            meta: { title: "首页" },
            path: "main/home",
            name: "home"
          },
          {
            meta: { title: currentPathObj.meta.title },
            path: "",
            name: name
          }
        ];
      } else {
        let childObj = currentPathObj.children.filter((child: any) => {
          return child.name === name;
        })[0];
        currentPathArr = [
          {
            meta: { title: "首页" },
            path: "main/home",
            name: "home"
          },
          {
            meta: { title: currentPathObj.meta.title },
            path: "",
            name: ""
          },
          {
            meta: { title: childObj.meta.title },
            path: currentPathObj.path + "/" + childObj.path,
            name: name
          }
        ];
      }
    }
    vm.$store.commit("app/setCurrentPath", currentPathArr);

    return currentPathArr;
  }
  openNewPage(vm: Vue, name: string | undefined, argu?: any, query?: any) {
    var store = vm.$store || vm.$options.store;
    let pageOpenedList = store.state.app.pageOpenedList;
    let openedPageLen = pageOpenedList.length;
    let i = 0;
    let tagHasOpened = false;
    while (i < openedPageLen) {
      if (name === pageOpenedList[i].name) {
        // 页面已经打开
        store.commit("app/pageOpenedList", {
          index: i,
          argu: argu,
          query: query
        });
        tagHasOpened = true;
        break;
      }
      i++;
    }
    if (!tagHasOpened) {
      let tag = store.state.app.tagsList.filter((item: any) => {
        if (item.children) {
          return name === item.children[0].name;
        } else {
          return name === item.name;
        }
      });
      tag = tag[0];
      if (tag) {
        tag = tag.children ? tag.children[0] : tag;
        if (argu) {
          tag.argu = argu;
        }
        if (query) {
          tag.query = query;
        }
        store.commit("app/increateTag", tag);
      }
    }
    store.commit("app/setCurrentPageName", name);
  }
  fullscreenEvent(vm: Vue) {
    vm.$store.commit("app/initCachepage");
    // 权限菜单过滤相关
    vm.$store.commit("app/updateMenulist");
    // 全屏相关
  }
  extend(...args: any[]) {
    let options,
      name,
      src,
      srcType,
      copy,
      copyType,
      copyIsArray,
      clone,
      target = args[0] || {},
      i = 1,
      length = args.length,
      deep = false;
    if (typeof target === "boolean") {
      deep = target;
      target = args[i] || {};
      i++;
    }
    if (typeof target !== "object" && typeof target !== "function") {
      target = {};
    }
    if (i === length) {
      target = this;
      i--;
    }
    for (; i < length; i++) {
      if ((options = args[i]) !== null) {
        for (name in options) {
          src = target[name];
          copy = options[name];
          if (target === copy) {
            continue;
          }
          srcType = Array.isArray(src) ? "array" : typeof src;
          if (
            deep &&
            copy &&
            ((copyIsArray = Array.isArray(copy)) || typeof copy === "object")
          ) {
            if (copyIsArray) {
              copyIsArray = false;
              clone = src && srcType === "array" ? src : [];
            } else {
              clone = src && srcType === "object" ? src : {};
            }
            target[name] = this.extend(deep, clone, copy);
          } else if (copy !== undefined) {
            target[name] = copy;
          }
        }
      }
    }
    return target;
  }
  genderTree(
    list: Array<any>,
    key: string,
    range?: Array<any>,
    parentId?: number | null
  ) {
    var result = new Array<any>();
    list.forEach((item: any) => {
      let t: any = {};
      t.id = item.id;
      t.title = item.name;
      t.code = item.code;
      t.parentId = item.parentId;
      t.checked = false;
      if (range) {
        const temp = range.findIndex(w => w === item.code);
        if (temp > 0) {
          if (!item.children || item.children.length <= 0) {
            t.checked = true;
            t.expand = true;
          } else {
            t.checked = false;
            t.expand = false;
          }
        } else {
          t.checked = false;
          t.expand = false;
        }
      }
      if (item[key] == parentId) {
        t.children = this.genderTree(list, key, range, item.id);
        if (t.children && t.children.length > 0) {
          var tem = t.children.filter((c: any) => c.checked);
          t.checked = tem.length == t.children.length;
        }

        result.push(t);
      }
    });
    return result;
  }

  genderMenu(list: Array<any>, key: string, parentId?: number | null) {
    var result = new Array<any>();
    list.forEach((item: any) => {
      let t: any = {};
      t.id = item.id;
      t.title = item.name;
      t.code = item.code;
      t.parentId = item.parentId;
      t.url = item.url;
      t.type = item.type;
      t.expand = true;
      if (item[key] == parentId) {
        t.children = this.genderMenu(list, key, item.id);
        result.push(t);
      }
    });
    return result;
  }
  deptNode = (
    list: Array<any>,
    node: any,
    result: Array<any> = new Array<any>()
  ) => {
    result.push(node.code);
    let parent = list.find(c => c.id == node.parentId);
    if (parent) {
      result.push(parent.code);
      this.deptNode(list, parent, result);
    }
  };
}
const util = new Util();
export default util;
