package com.monkey.core.dtos;

public class ProductSaleStatical {
    private String productName;
    private Integer saleCount;
    private Integer saleMoney;
    private String maxDevice;

    public Integer getSaleMoney() {
        return saleMoney;
    }

    public void setSaleMoney(Integer saleMoney) {
        this.saleMoney = saleMoney;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }

    public String getMaxDevice() {
        return maxDevice;
    }

    public void setMaxDevice(String maxDevice) {
        this.maxDevice = maxDevice;
    }
}
