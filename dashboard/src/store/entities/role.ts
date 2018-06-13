import Entity from './entity'

export default class Role extends Entity<number>{
    roleName:string;
    displayName:string;
    isStatic:boolean;
    permissions:string[]
}