import Entity from "@/store/entities/entity";

export default class Device extends Entity<number> {
    deviceName: string;
    deviceNum: string;
    deviceType: string;
    pointId: number;
    description: string;
    creationTime: Date;
    creatorUserId: number;
  }