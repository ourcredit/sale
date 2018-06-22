import {Store,Module,ActionContext} from 'vuex'
import ListModule from './list-module'
import ListState from './list-state'
import Ajax from '../../lib/ajax'
import PageResult from '@/store/entities/page-result';
import ListMutations from './list-mutations'
import { stat } from 'fs';
interface LogState extends ListState<any>{

}
class UserMutations extends ListMutations<LogState>{

}
class LogModule extends ListModule<LogState,any,any>{
    state={
        totalCount:0,
        currentPage:1,
        pageSize:10,
        list: new Array<any>(),
        loading:false,
    }
    actions={
        async getAll(context:ActionContext<LogState,any>,payload:any){
            context.state.loading=true;
            let reponse=await Ajax.post('/api/log',payload.data);
            context.state.loading=false;
            let page=reponse.data as PageResult<any>;
            context.state.totalCount=page.total;
            context.state.list=page.records;
        },
        async delete(context:ActionContext<LogState,any>,payload:any){
            await Ajax.delete('/api/log/'+payload.data.id);
        },
        async batch(context:ActionContext<LogState,any>,payload:any){
            await Ajax.post('/api/log/batch',payload.data);
        },
        async get(context:ActionContext<LogState,any>,payload:any){
            let reponse=await Ajax.get('/api/log/'+payload.id);
            return reponse.data.result ;
        }
    };
    mutations={
        setCurrentPage(state:LogState,page:number){
            state.currentPage=page;
        },
        setPageSize(state:LogState,pagesize:number){
            state.pageSize=pagesize;
        }
    }
}
const logModule=new LogModule();
export default logModule;