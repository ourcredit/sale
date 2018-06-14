import Entity from './entity'

export default class Menu extends Entity<number>{
    name:string;
    url:string;
    type:number;
    code:string;
    parentId:number
}