import Entity from "@/store/entities/entity";

export default class Tenant extends Entity<number> {
  displayName: string;
  name: string;

}
