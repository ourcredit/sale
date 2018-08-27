import { Store, Module, ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Ajax from "@/lib/ajax";
import Category from "@/store/entities/category";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
import { stat } from "fs";
interface ICategoryState extends IListState<Category> {
  editCategory: Category;
}
class CategoryMutations extends ListMutations<Category> { }
class CategoryModule extends ListModule<ICategoryState, any, Category> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<Category>(),
    loading: false,
    editCategory: new Category(),
  };
  actions = {
    async getAll(
      context: ActionContext<ICategoryState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/category", payload.data);
      context.state.loading = false;
      let page: PageResult<Category> = reponse.data as PageResult<Category>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async all(
      context: ActionContext<ICategoryState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/category/all");
      context.state.loading = false;
      let page: Array<any> = reponse.data as Array<Category>;
      context.state.list = page;
    },
    async modify(
      context: ActionContext<ICategoryState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/category", payload.data);
    },

    async delete(
      context: ActionContext<ICategoryState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.delete("/api/category/" + payload.data.id);
    },
    async get(
      context: ActionContext<ICategoryState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/category/" + payload.data);
      context.state.editCategory = reponse.data as Category;
    }
  };
  mutations = {
    setCurrentPage(state: ICategoryState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: ICategoryState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: ICategoryState, de: Category): void {
      state.editCategory = de;
    }
  };
}
const cateModule: CategoryModule = new CategoryModule();
export default cateModule;
