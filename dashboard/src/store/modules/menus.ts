import { Store, Module, ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Ajax from "@/lib/ajax";
import Menu from "@/store/entities/menu";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
import { stat } from "fs";
interface IMenuState extends IListState<Menu> {
  editMenu: Menu;
}
class MenuMutations extends ListMutations<Menu> {}
class MenuModule extends ListModule<IMenuState, any, Menu> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<Menu>(),
    loading: false,
    editMenu: new Menu()
  };
  actions = {
    async getAll(
      context: ActionContext<IMenuState, Menu>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/menu", payload.data);
      context.state.loading = false;
      let page: PageResult<Menu> = reponse.data as PageResult<Menu>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async create(
      context: ActionContext<IMenuState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/menu", payload.data);
    },
    async update(
      context: ActionContext<IMenuState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/menu/modify", payload.data);
    },
    async delete(
      context: ActionContext<IMenuState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.delete("/api/menu/" + payload.data.id);
    },
    async get(
      context: ActionContext<IMenuState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/menu/" + payload.id);
      return reponse.data;
    }
  };
  mutations = {
    setCurrentPage(state: IMenuState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IMenuState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: IMenuState, menu: Menu): void {
      state.editMenu = menu;
    }
  };
}
const menuModule: MenuModule = new MenuModule();
export default menuModule;
