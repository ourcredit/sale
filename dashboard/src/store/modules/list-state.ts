export default interface IListState<T> {
    totalCount:number;
    currentPage:number;
    pageSize:number;
    list:Array<T>;
    loading:boolean;
}