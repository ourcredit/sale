import {Store,Module,ActionContext} from 'vuex'
import ListModule from './list-module'
import ListState from './list-state'
import Role from '../entities/role'
import Ajax from '../../lib/ajax'
import PageResult from '@/store/entities/page-result';
import ListMutations from './list-mutations'
import { stat } from 'fs';
interface RoleState extends ListState<Role>{
    editRole:Role;
    permissions:Array<string>
}
class RoleModule extends ListModule<RoleState,any,Role>{
    state={
        totalCount:0,
        currentPage:1,
        pageSize:10,
        list: new Array<Role>(),
        loading:false,
        editRole:new Role(),
        permissions:new Array<string>()
    }
    actions={
        async getAll(context:ActionContext<RoleState,any>,payload:any){
            context.state.loading=true;
            let reponse=await Ajax.post('/api/role',payload.data);
            context.state.loading=false;
            let page=reponse.data as PageResult<Role>;
            context.state.totalCount=page.total;
            context.state.list=page.records;
        },
        async modify(context:ActionContext<RoleState,any>,payload:any){
            await Ajax.put('/api/role/modify',payload.data);
        },
        async delete(context:ActionContext<RoleState,any>,payload:any){
            await Ajax.delete('/api/role/'+payload.data.id);
        },
        async batch(context:ActionContext<RoleState,any>,payload:any){
            await Ajax.post('/api/role/batch',payload.data);
        },
        async get(context: ActionContext<RoleState, any>, payload: any) {
            let reponse=await Ajax.get('/api/role/'+payload.data);
           // return reponse.data.result as Role;
            context.state.editRole = reponse.data as Role;
        },
        async getAllPermissions(context:ActionContext<RoleState,any>){
            let reponse=await Ajax.post('/api/menu',{index:1,size:999});
            context.state.permissions=reponse.data.records;
        }
    };
    mutations={
        setCurrentPage(state:RoleState,page:number){
            state.currentPage=page;
        },
        setPageSize(state:RoleState,pagesize:number){
            state.pageSize=pagesize;
        },
        edit(state:RoleState,role:Role){
            state.editRole=role;
        }
    }
}
const roleModule=new RoleModule();
export default roleModule;