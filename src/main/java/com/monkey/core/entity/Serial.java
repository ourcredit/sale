package com.monkey.core.entity;

import java.util.Date;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing
 * @since 2018-09-12
 */
@TableName("sale_serial")
public class Serial extends Model<Serial> {

    private static final long serialVersionUID = 1L;

    /**
     * guid
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 订单编号
     */
    private String order;
    /**
     * 退款单价格
     */
    private Integer price;
    /**
     * 退款单号
     */
    private String backOrder;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date creationTime;
    /**
     * 创建人id
     */
    @TableField(fill = FieldFill.INSERT)
    private Integer creatorUserId;
    /**
     * 租户id
     */
    private Integer tenantId;
    /**
     * 商品id
     */
    private Integer productId;
    /**
     * 商品名
     */
    private String productName;
    /**
     * 单号类型 1支付 2退款
     */
    private Integer type;
    /**
     * 设备id
     */
    private Integer deviceId;
    /**
     * 设备名
     */
    private String deviceName;
    /**
     * 点位id
     */
    private Integer pointId;
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

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getBackOrder() {
        return backOrder;
    }

    public void setBackOrder(String backOrder) {
        this.backOrder = backOrder;
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

    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public Integer getPointId() {
        return pointId;
    }

    public void setPointId(Integer pointId) {
        this.pointId = pointId;
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
        return "Serial{" +
        "id=" + id +
        ", order=" + order +
        ", price=" + price +
        ", backOrder=" + backOrder +
        ", creationTime=" + creationTime +
        ", creatorUserId=" + creatorUserId +
        ", tenantId=" + tenantId +
        ", productId=" + productId +
        ", productName=" + productName +
        ", type=" + type +
        ", deviceId=" + deviceId +
        ", deviceName=" + deviceName +
        ", pointId=" + pointId +
        ", pointName=" + pointName +
        "}";
    }
}
