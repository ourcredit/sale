import { Store, Module, ActionContext, MutationTree } from "vuex";
import IListState from "./list-state";

export default class ListModule<T extends IListState<U>, R, U>
  implements Module<IListState<U>, R> {
  namespaced = true;
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<U>(),
    loading: false
  };
  mutations = {
    setCurrentPage(state: IListState<U>, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IListState<U>, pagesize: number): void {
      state.pageSize = pagesize;
    }
  };
}
