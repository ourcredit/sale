import { Store, Module, ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Ajax from "@/lib/ajax";
import Device from "@/store/entities/device";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
import { stat } from "fs";
import { O_NONBLOCK } from "constants";
import util from "@/lib/util";
interface IDeviceState extends IListState<Device> {
  editDevice: Device;
  products: Array<any>;
  payfor: any;
  tree: Array<any>;
}
class PointMutations extends ListMutations<Device> {}
class PointModule extends ListModule<IDeviceState, any, Device> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<Device>(),
    loading: false,
    editDevice: new Device(),
    products: new Array<any>(),
    deviceCate: ["格子机", "售货机", "抓娃娃机", "咖啡机"],
    payfor: new Object(),
    tree: new Array<any>()
  };
  actions = {
    async getAll(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/device", payload.data);
      context.state.loading = false;
      let page: PageResult<Device> = reponse.data as PageResult<Device>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async getAllProducts(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/device/products", payload.data);
      context.state.loading = false;
      let page: PageResult<any> = reponse.data as PageResult<any>;
      context.state.totalCount = page.total;
      context.state.products = page.records;
    },
    async modify(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/device", payload.data);
    },
    async allowProducts(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/device/products", payload.data);
    },
    async initTree(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/tree", payload.data);
      context.state.loading = false;
      let list: Array<any> = reponse.data as Array<any>;
      context.state.tree = util.genderMenu(list, "parentId", null);
    },
    async delete(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.delete("/api/device/" + payload.data.id);
    },
    async get(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/device/" + payload.data);
      context.state.editDevice = reponse.data as Device;
    },
    async getAccount(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/payfor/" + payload.data);
      context.state.payfor = reponse.data as any;
    },
    async putAccount(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/payfor", payload.data);
    }
  };
  mutations = {
    setCurrentPage(state: IDeviceState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IDeviceState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: IDeviceState, de: Device): void {
      state.editDevice = de;
    }
  };
}
const userModule: PointModule = new PointModule();
export default userModule;
