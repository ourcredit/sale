import { Store, Module, ActionContext } from "vuex";
import ListModule from "./list-module";
import IListState from "./list-state";
import Ajax from "../../lib/ajax";
import PageResult from "@/store/entities/page-result";
import ListMutations from "./list-mutations";
import { stat } from "fs";
interface ILogState extends IListState<any> {}
class UserMutations extends ListMutations<ILogState> {}
class LogModule extends ListModule<ILogState, any, any> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<any>(),
    loading: false
  };
  actions = {
    async getAll(
      context: ActionContext<ILogState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/log", payload.data);
      context.state.loading = false;
      let page: PageResult<any> = reponse.data as PageResult<any>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async delete(
      context: ActionContext<ILogState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.delete("/api/log/" + payload.data.id);
    },
    async batch(
      context: ActionContext<ILogState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.post("/api/log/batch", payload.data);
    },
    async get(
      context: ActionContext<ILogState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/log/" + payload.id);
      return reponse.data.result;
    }
  };
  mutations = {
    setCurrentPage(state: ILogState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: ILogState, pagesize: number): void {
      state.pageSize = pagesize;
    }
  };
}
const logModule: LogModule = new LogModule();
export default logModule;
