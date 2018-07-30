import Entity from "@/store/entities/entity";
export default class User extends Entity<number> {
  password: string;
}
