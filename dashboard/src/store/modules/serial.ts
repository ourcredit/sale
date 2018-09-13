import { Store, Module, ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Ajax from "@/lib/ajax";
import Serial from "@/store/entities/serial";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
import { stat } from "fs";
interface ISerialState extends IListState<Serial> {
  editCategory: Serial;
}
class CategoryMutations extends ListMutations<Serial> { }
class SerialModule extends ListModule<ISerialState, any, Serial> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<Serial>(),
    loading: false,
    editCategory: new Serial(),
  };
  actions = {
    async getAll(
      context: ActionContext<ISerialState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/serial", payload.data);
      context.state.loading = false;
      let page: PageResult<Serial> = reponse.data as PageResult<Serial>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async get(
      context: ActionContext<ISerialState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/serial/" + payload.data);
      context.state.editCategory = reponse.data as Serial;
    }
  };
  mutations = {
    setCurrentPage(state: ISerialState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: ISerialState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: ISerialState, de: Serial): void {
      state.editCategory = de;
    }
  };
}
const serial: SerialModule = new SerialModule();
export default serial;
