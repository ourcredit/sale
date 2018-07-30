import { Store, Module, ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Ajax from "@/lib/ajax";
import Product from "@/store/entities/product";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
import { stat } from "fs";
interface IProductState extends IListState<Product> {
  editProduct: Product;
}
class ProductMutations extends ListMutations<Product> {}
class ProductModule extends ListModule<IProductState, any, Product> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<Product>(),
    loading: false,
    editProduct: new Product(),
    productCate: ["日化", "电器", "虚拟", "衣物"]
  };
  actions = {
    async getAll(
      context: ActionContext<IProductState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/product", payload.data);
      context.state.loading = false;
      let page: PageResult<Product> = reponse.data as PageResult<Product>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async modify(
      context: ActionContext<IProductState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/product", payload.data);
    },

    async delete(
      context: ActionContext<IProductState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.delete("/api/product/" + payload.data.id);
    },
    async get(
      context: ActionContext<IProductState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/product/" + payload.data);
      context.state.editProduct = reponse.data as Product;
    }
  };
  mutations = {
    setCurrentPage(state: IProductState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IProductState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: IProductState, de: Product): void {
      state.editProduct = de;
    }
  };
}
const userModule: ProductModule = new ProductModule();
export default userModule;
