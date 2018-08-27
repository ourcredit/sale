import { ActionContext } from "vuex";
import ListModule from "@/store/modules/base/list-module";
import IListState from "@/store/modules/base/list-state";
import Ajax from "@/lib/ajax";
import Util from "@/lib/util";
import PageResult from "@/store/entities/page-result";
import ListMutations from "@/store/modules/base/list-mutations";
interface IDeviceState extends IListState<any> {
  todayStatical: any;
  monthStatical: any;
  todaySale: any;
  monthSale: any;
  payType: any;
  todayTop: any;
  monthTop: any;
  saleCount: Number;
}
class PointMutations extends ListMutations<any> { }
class DashModule extends ListModule<IDeviceState, any, any> {
  state = {
    totalCount: 0,
    currentPage: 1,
    pageSize: 10,
    list: null,
    loading: false,
    saleCount: 0,
    todayStatical: Object,
    monthStatical: Object,
    todaySale: null,
    monthSale: null,
    payType: null,
    todayTop: null,
    monthTop: null
  };

  actions = {
    async getDashboard(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.get("/api/order/dashboard");
      context.state.loading = false;
      let r: any = reponse.data as any;
      context.state.todaySale = r.todaySale;
      context.state.monthSale = r.monthSale;

      if (r.payType && r.payType.length == 2) {
        let t: Array<any> = new Array<any>();
        let total: Number = 0;
        if (r.payType[0].time == "1") {
          t.push({ name: "微信", y: r.payType[0].count })
          total += r.payType[0].count;
        }
        if (r.payType[1].time == "2") {
          t.push({ name: "支付宝", y: r.payType[1].count })
          total += r.payType[1].count;
        }
        context.state.payType = t;
        context.state.saleCount = total;
      }
      context.state.todayTop = r.todayTop;
      context.state.monthTop = r.monthTop;
    },
    async getStaticial(
      context: ActionContext<IDeviceState, any>,
      payload: any
    ): Promise<any> {
      context.state.loading = true;
      let reponse: any = await Ajax.post(`/api/order/total`, payload.data);
      context.state.loading = false;
      let r: any = reponse.data as any;
      context.state.todayStatical = r.today;
      context.state.monthStatical = r.month;
    }
  };
  mutations = {
    setCurrentPage(state: IDeviceState, page: number): void {
      state.currentPage = page;
    },
    setPageSize(state: IDeviceState, pagesize: number): void {
      state.pageSize = pagesize;
    }
  };

}
const userModule: DashModule = new DashModule();
export default userModule;
