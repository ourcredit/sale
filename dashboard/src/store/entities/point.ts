import Entity from "./entity";

export default class Point extends Entity<number> {
  pointName: string;
  address: string;
  description: string;
  x: string;
  y: string;
  creationTime: Date;
  creatorUserId: number;
}
