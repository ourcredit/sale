import ajax from "../../lib/ajax";
const account: any = {
  namespaced: true,
  state: {},
  actions: {
    async isTenantAvailable(state: any, payload: any): Promise<any> {
      let rep: any = await ajax.post(
        "/api/services/app/Account/IsTenantAvailable",
        payload.data
      );
      return rep.data.result;
    }
  }
};
export default account;
