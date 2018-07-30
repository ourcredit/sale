import Entity from "@/store/entities/entity";

export default class Product extends Entity<number> {
  productName: string;
  productNum: string;
  productType: string;
  price: number;
  creationTime: Date;
  creatorUserId: number;
  isDeleted: number;
}
