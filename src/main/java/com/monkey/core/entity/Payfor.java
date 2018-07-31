package com.monkey.core.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-30
 */
@TableName("sale_payfor")
public class Payfor extends Model<Payfor> {

    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 运营商key
     */
    private Integer operatorId;
    /**
     * 阿里key
     */
    private String alipayId;
    /**
     * 阿里密钥
     */
    private String alipayKey;
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
     * 阿里保留
     */
    private String alipayAgent;
    /**
     * 微信id
     */
    private String wechatpayId;
    /**
     * 微信key
     */
    private String wechatpayKey;
    /**
     * 微信保留
     */
    private String wechatpayAgent;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    public String getAlipayId() {
        return alipayId;
    }

    public void setAlipayId(String alipayId) {
        this.alipayId = alipayId;
    }

    public String getAlipayKey() {
        return alipayKey;
    }

    public void setAlipayKey(String alipayKey) {
        this.alipayKey = alipayKey;
    }

    public String getAlipayAgent() {
        return alipayAgent;
    }

    public void setAlipayAgent(String alipayAgent) {
        this.alipayAgent = alipayAgent;
    }

    public String getWechatpayId() {
        return wechatpayId;
    }

    public void setWechatpayId(String wechatpayId) {
        this.wechatpayId = wechatpayId;
    }

    public String getWechatpayKey() {
        return wechatpayKey;
    }

    public void setWechatpayKey(String wechatpayKey) {
        this.wechatpayKey = wechatpayKey;
    }

    public String getWechatpayAgent() {
        return wechatpayAgent;
    }

    public void setWechatpayAgent(String wechatpayAgent) {
        this.wechatpayAgent = wechatpayAgent;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Payfor{" +
        "id=" + id +
        ", operatorId=" + operatorId +
        ", alipayId=" + alipayId +
        ", alipayKey=" + alipayKey +
        ", alipayAgent=" + alipayAgent +
        ", wechatpayId=" + wechatpayId +
        ", wechatpayKey=" + wechatpayKey +
        ", wechatpayAgent=" + wechatpayAgent +
        "}";
    }
    /**
     * 租户id
     */
    private Integer tenantId;
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
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
}
