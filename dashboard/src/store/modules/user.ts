import { Store, Module, ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import User from "@/store/entities/user";
import Role from "@/store/entities/role";
import Ajax from "@/lib/ajax";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
import { stat } from "fs";
interface IUserState extends IListState<User> {
  editUser: User;
  roles: Role[];
}
class UserMutations extends ListMutations<User> {}
class UserModule extends ListModule<IUserState, any, User> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<User>(),
    loading: false,
    editUser: new User(),
    roles: new Array<Role>()
  };
  actions = {
    async getAll(
      context: ActionContext<IUserState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/user", payload.data);
      context.state.loading = false;
      let page: PageResult<User> = reponse.data as PageResult<User>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async modify(
      context: ActionContext<IUserState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/user", payload.data);
    },

    async delete(
      context: ActionContext<IUserState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.delete("/api/user/" + payload.data.id);
    },
    async get(
      context: ActionContext<IUserState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/user/" + payload.data.id);
      context.state.editUser = reponse.data as User;
    },
    async getRoles(context: ActionContext<IUserState, any>): Promise<any> {
      let reponse: any = await Ajax.post("/api/role", { index: 1, size: 99 });
      context.state.roles = reponse.data.records;
    }
  };
  mutations = {
    setCurrentPage(state: IUserState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IUserState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: IUserState, user: User): void {
      state.editUser = user;
    }
  };
}
const userModule: UserModule = new UserModule();
export default userModule;
