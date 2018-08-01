import { Store, Module, ActionContext } from "vuex";
import ListModule from "./base/list-module";
import ListState from "./base/list-state";
import Tenant from "../entities/tenant";
import Ajax from "../../lib/ajax";
import PageResult from "@/store/entities/page-result";
import auth from "@/lib/auth";
import ListMutations from "./base/list-mutations";
interface ITenantState extends ListState<Tenant> {
  editTenant: Tenant;
}
class TenantModule extends ListModule<ITenantState, any, Tenant> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<Tenant>(),
    loading: false,
    editTenant: new Tenant()
  };
  actions = {
    async getAll(
      context: ActionContext<ITenantState, any>,
      payload: any
    ): Promise<void> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/tenant", {
        params: payload.data
      });
      context.state.loading = false;
      let page: PageResult<Tenant> = reponse.data as PageResult<Tenant>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async modify(
      context: ActionContext<ITenantState, any>,
      payload: any
    ): Promise<void> {
       Ajax.put("/api/tenant", payload.data);
    },
    async delete(
      context: ActionContext<ITenantState, any>,
      payload: any
    ): Promise<void> {
      await Ajax.delete("/api/tenant/" + payload.data.id);
    },
    async get(
      context: ActionContext<ITenantState, any>,
      payload: any
    ): Promise<Tenant> {
      let reponse: any = await Ajax.get("/api/tenant/" + payload.id);
      return reponse.data.result as Tenant;
    }
  };
  mutations = {
    setCurrentPage(state: ITenantState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: ITenantState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: ITenantState, tenant: Tenant): void {
      state.editTenant = tenant;
    }
  };
}
const tenantModule: TenantModule = new TenantModule();
export default tenantModule;
