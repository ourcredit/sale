import { Store, Module, ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Ajax from "@/lib/ajax";
import Point from "@/store/entities/point";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
import { stat } from "fs";
interface IPointState extends IListState<Point> {
  editPoint: Point;
}
class PointMutations extends ListMutations<Point> { }
class PointModule extends ListModule<IPointState, any, Point> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: new Array<Point>(),
    loading: false,
    editPoint: new Point()
  };
  actions = {
    async getAll(
      context: ActionContext<IPointState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post("/api/point", payload.data);
      context.state.loading = false;
      let page: PageResult<Point> = reponse.data as PageResult<Point>;
      context.state.totalCount = page.total;
      context.state.list = page.records;
    },
    async modify(
      context: ActionContext<IPointState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.put("/api/point", payload.data);
    },
    async batch(
      context: ActionContext<IPointState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.post("/api/point/batch", payload.data);
    },
    async delete(
      context: ActionContext<IPointState, any>,
      payload: any
    ): Promise<any> {
      await Ajax.delete("/api/point/" + payload.data.id);
    },
    async get(
      context: ActionContext<IPointState, any>,
      payload: any
    ): Promise<any> {
      let reponse: any = await Ajax.get("/api/point/" + payload.data);
      context.state.editPoint = reponse.data as Point;
    }
  };
  mutations = {
    setCurrentPage(state: IPointState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IPointState, pagesize: number): void {
      state.pageSize = pagesize;
    },
    edit(state: IPointState, user: Point): void {
      state.editPoint = user;
    }
  };
}
const userModule: PointModule = new PointModule();
export default userModule;
