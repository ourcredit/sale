package com.monkey.core.dtos;

public class DeviceSaleStatical {
    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceNum() {
        return deviceNum;
    }

    public void setDeviceNum(String deviceNum) {
        this.deviceNum = deviceNum;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getPointName() {
        return pointName;
    }

    public void setPointName(String pointName) {
        this.pointName = pointName;
    }

    public Integer getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }

    public Integer getSaleMoney() {
        return saleMoney;
    }

    public void setSaleMoney(Integer saleMoney) {
        this.saleMoney = saleMoney;
    }

    public String getMaxProduct() {
        return maxProduct;
    }

    public void setMaxProduct(String maxProduct) {
        this.maxProduct = maxProduct;
    }

    private String deviceName;
    private String deviceNum;
    private String deviceType;
    private String pointName;
    private Integer saleCount;
    private Integer saleMoney;
    private String maxProduct;
}
