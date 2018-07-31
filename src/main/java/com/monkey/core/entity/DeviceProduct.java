package com.monkey.core.entity;

import java.math.BigDecimal;
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
 * @since 2018-07-26
 */
@TableName("sale_device_product")
public class DeviceProduct extends Model<DeviceProduct> {

    public DeviceProduct(){}
    public DeviceProduct(String id, Integer productId,Integer deviceId,Integer isSale,BigDecimal price){
        this.id=id;
        this.productId=productId;
        this.deviceId=deviceId;
        this.isSale=isSale;
        this.price=price;
    }
    private static final long serialVersionUID = 1L;

    /**
     * guid
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 产品id
     */
    private Integer productId;
    /**
     * 设备id
     */
    private Integer deviceId;
    /**
     * 是否售卖
     */
    private Integer isSale;
    /**
     * 价格
     */
    private BigDecimal price;
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
    @TableField(fill = FieldFill.INSERT)
    private Integer tenantId;
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Integer deviceId) {
        this.deviceId = deviceId;
    }

    public Integer getIsSale() {
        return isSale;
    }

    public void setIsSale(Integer isSale) {
        this.isSale = isSale;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
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

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "DeviceProduct{" +
        "id=" + id +
        ", productId=" + productId +
        ", deviceId=" + deviceId +
        ", isSale=" + isSale +
        ", price=" + price +
        ", creationTime=" + creationTime +
        ", creatorUserId=" + creatorUserId +
        "}";
    }
}
