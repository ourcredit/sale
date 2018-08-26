import ajax from "@/lib/ajax";
import util from "@/lib/util";
import auth from "@/lib/auth";
import { Store, Module, ActionContext } from "vuex";
interface ISessionState {
  application: any;
  user: any;
  tenant: any;
  roles: any;
  canBack: Boolean;
}
class SessionStore implements Module<ISessionState, any> {
  namespaced = true;
  state = {
    application: null,
    user: null,
    tenant: null,
    roles: null,
    canBack: false
  };
  actions = {
    async init(content: ActionContext<ISessionState, any>): Promise<any> {
      var token: string = auth.getToken();
      if (!token) {
        auth.setToken();
        return;
      }
      let rep: any = await ajax.get("/api/user/current");
      content.state.user = rep.data.user;
      content.state.roles = rep.data.role;
      content.state.canBack = rep.data.canBack;
      auth.init(rep.data.allPermissions, rep.data.permissions);
    }
  };
}
const session: SessionStore = new SessionStore();
export default session;
