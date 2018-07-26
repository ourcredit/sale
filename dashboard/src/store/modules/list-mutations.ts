import IListState from "./list-state";

export default class ListMutations<U> {
    setCurrentPage(state:IListState<U>,page:number):void {
        state.currentPage=page;
    }
    setPageSize(state:IListState<U>,pagesize:number):void {
        state.pageSize=pagesize;
    }
}