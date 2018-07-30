import { Store, Module, ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Role from "@/store/entities/role";
import Ajax from "@/lib/ajax";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
import { stat } from "fs";
interface IRoleState extends IListState<Role> {
  editRole: Role;
  permissions: Array<string>;
}
class RoleModule extends ListModule<IRoleState, any, Role> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<Role>(),
    loading: false,
    editRole: new Role(),
    permissions: new Array<string>()
  };
  actions = {
    async getAll(
      context: ActionContext<IRoleState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/role", payload.data);
      context.state.loading = false;
      let page: PageResult<Role> = reponse.data as PageResult<Role>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async modify(
      context: ActionContext<IRoleState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/role", payload.data);
    },
    async delete(
      context: ActionContext<IRoleState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.delete("/api/role/" + payload.data.id);
    },
    async batch(
      context: ActionContext<IRoleState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.post("/api/role/batch", payload.data);
    },
    async get(
      context: ActionContext<IRoleState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/role/" + payload.data);
      // return reponse.data.result as Role;
      context.state.editRole = reponse.data as Role;
    },
    async getAllPermissions(
      context: ActionContext<IRoleState, any>
    ): Promise<any> {
      let reponse: any = await Ajax.post("/api/menu", { index: 1, size: 999 });
      context.state.permissions = reponse.data.records;
    }
  };
  mutations = {
    setCurrentPage(state: IRoleState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IRoleState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: IRoleState, role: Role): void {
      state.editRole = role;
    }
  };
}
const roleModule: RoleModule = new RoleModule();
export default roleModule;
