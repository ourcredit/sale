package com.monkey.web.controller.dtos;

import java.math.BigDecimal;
import java.util.List;

public class OrderInput {
    public List<ProductInput> products;
    public String deviceNum;
    public Boolean isWechatOrder;
  public   class ProductInput{
        public  Integer productId;
        public  Integer price;
    }
}
