import {Store,Module,ActionContext} from 'vuex'
import ListModule from './list-module'
import ListState from './list-state'
import Ajax from '../../lib/ajax'
import Menu from '../entities/menu'
import PageResult from '@/store/entities/page-result';
import ListMutations from './list-mutations'
import { stat } from 'fs';
interface MenuState extends ListState<Menu>{
    editMenu:Menu;
}
class MenuMutations extends ListMutations<Menu>{

}
class MenuModule extends ListModule<MenuState,any,Menu>{
    state={
        totalCount:0,
        currentPage:1,
        pageSize:10,
        list: new Array<Menu>(),
        loading:false,
        editMenu:new Menu()
    }
    actions={
        async getAll(context:ActionContext<MenuState,Menu>,payload:any){
            context.state.loading=true;
            let reponse=await Ajax.post('/api/menu',payload.data);
            context.state.loading=false;
            let page=reponse.data as PageResult<Menu>;
            context.state.totalCount=page.total;
            context.state.list=page.records;
        },
        async create(context:ActionContext<MenuState,any>,payload:any){
            await Ajax.put('/api/menu',payload.data);
        },
        async update(context:ActionContext<MenuState,any>,payload:any){
            await Ajax.put('/api/menu/modify',payload.data);
        },
        async delete(context:ActionContext<MenuState,any>,payload:any){
            await Ajax.delete('/api/menu/'+payload.data.id);
        },
        async get(context:ActionContext<MenuState,any>,payload:any){
            let reponse=await Ajax.get('/api/menu/'+payload.id);
            return reponse.data ;
        }
    };
    mutations={
        setCurrentPage(state:MenuState,page:number){
            state.currentPage=page;
        },
        setPageSize(state:MenuState,pagesize:number){
            state.pageSize=pagesize;
        },
        edit(state:MenuState,menu:Menu){
            state.editMenu = menu;
        }
    }
}
const menuModule=new MenuModule();
export default menuModule;