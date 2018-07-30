import Entity from "@/store/entities/entity";

export default class Menu extends Entity<number> {
  name: string;
  url: string;
  type: number;
  code: string;
  parentId: number;
}
