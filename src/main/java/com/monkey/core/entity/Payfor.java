package com.monkey.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

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
}
