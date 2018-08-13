package com.monkey.core.entity;

import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-13
 */
@TableName("sale_order")
public class Order extends Model<Order> {

    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 商品名
     */
    private String productName;
    /**
     * 商品id
     */
    private Integer productId;
    /**
     * 价格
     */
    private BigDecimal price;
    /**
     * 微信订单
     */
    private String wechatOrder;
    /**
     * 创建时间
     */
    private Date creationTime;
    /**
     * 创建人id
     */
    private Integer creatorUserId;
    /**
     * 订单状态
     */
    private Integer orderState;
    /**
     * 支付状态
     */
    private Integer payState;
    /**
     * 租户id
     */
    private Integer tenantId;
    /**
     * 设备id
     */
    private Integer deviceId;
    /**
     * 设备名
     */
    private String deviceName;
    /**
     * 设备类型
     */
    private String deviceType;
    /**
     * 点位名
     */
    private String pointName;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getWechatOrder() {
        return wechatOrder;
    }

    public void setWechatOrder(String wechatOrder) {
        this.wechatOrder = wechatOrder;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public Integer getCreatorUserId() {
        return creatorUserId;
    }

    public void setCreatorUserId(Integer creatorUserId) {
        this.creatorUserId = creatorUserId;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public Integer getPayState() {
        return payState;
    }

    public void setPayState(Integer payState) {
        this.payState = payState;
    }

    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    public Integer getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Integer deviceId) {
        this.deviceId = deviceId;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
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

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Order{" +
        "id=" + id +
        ", productName=" + productName +
        ", productId=" + productId +
        ", price=" + price +
        ", wechatOrder=" + wechatOrder +
        ", creationTime=" + creationTime +
        ", creatorUserId=" + creatorUserId +
        ", orderState=" + orderState +
        ", payState=" + payState +
        ", tenantId=" + tenantId +
        ", deviceId=" + deviceId +
        ", deviceName=" + deviceName +
        ", deviceType=" + deviceType +
        ", pointName=" + pointName +
        "}";
    }
}
