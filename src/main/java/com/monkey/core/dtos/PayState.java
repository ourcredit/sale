package com.monkey.core.dtos;

 public enum PayState {
    SUCCESS("支付成功", 1), FAIL("退款成功", 2), UNKONWN("未知状态", 0), NOCK("补位状态", -1);
    // 成员变量
    private String name;
    private int index;
    // 构造方法
    private PayState(String name, int index) {
        this.name = name;
        this.index = index;
    }
    // 覆盖方法
    @Override
    public String toString() {
        return this.index + "." + this.name;
    }
}
enum OrderState {
    SUCCESS("订单成功", 1), FAIL("订单失败", 2), UNKONWN("未知状态", 0), NOCK("补位状态", -1);
    // 成员变量
    private String name;
    private int index;
    // 构造方法
    private OrderState(String name, int index) {
        this.name = name;
        this.index = index;
    }
    // 覆盖方法
    @Override
    public String toString() {
        return this.index + "." + this.name;
    }
}

enum    PayType{
    WECHATPAY("微信订单", 1), ALIPAY("支付宝订单", 2);
    // 成员变量
    private String name;
    private int index;
    // 构造方法
    private PayType(String name, int index) {
        this.name = name;
        this.index = index;
    }
    // 覆盖方法
    @Override
    public String toString() {
        return this.index + "." + this.name;
    }
}