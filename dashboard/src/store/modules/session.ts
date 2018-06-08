import ajax from '../../lib/ajax';
import util from '../../lib/util'
import {Store,Module,ActionContext} from 'vuex' 
interface SessionState{
    application:any,
    user:any,
    tenant:any
}
class SessionStore implements Module<SessionState,any>{
    namespaced=true;
    state={
        application:null,
        user:null,
        tenant:null
    }
    actions={
        async init(content:ActionContext<SessionState,any>){
            let rep=await ajax.get('/api/user/current');
            content.state.user=rep.data;
        }
    }
}
const session=new SessionStore();
export default session;