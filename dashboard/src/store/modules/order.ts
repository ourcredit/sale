import { ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Ajax from "@/lib/ajax";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
interface IDeviceState extends IListState<any> {
  orders: Array<any>;
  payfor: any;
  tree: Array<any>;
  currentOrg: Number;
}
class PointMutations extends ListMutations<any> { }
class PointModule extends ListModule<IDeviceState, any, any> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<any>(),
    loading: false,
    deviceCate: ["格子机", "售货机", "抓娃娃机", "咖啡机"],
    currentOrg: null
  };
  actions = {
    async getAll(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/order", payload.data);
      context.state.loading = false;
      let page: PageResult<any> = reponse.data as PageResult<any>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async modify(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/device", payload.data);
    },
    async back(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.get(`/api/order/back/${payload.data}`);
    }
  };
  mutations = {
    setCurrentPage(state: IDeviceState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IDeviceState, pagesize: number): void {
      state.pageSize = pagesize;
    }
  };
}
const userModule: PointModule = new PointModule();
export default userModule;
