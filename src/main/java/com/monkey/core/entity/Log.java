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
 * 操作日志
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-27
 */
@TableName("sale_log")
public class Log extends Model<Log> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.UUID)
    private String id;
    /**
     * 日志类型
     */
    private String logDescription;
    /**
     * 日志名称
     */
    private String actionArgs;
    /**
     * 用户id
     */
    private String userName;
    /**
     * 类名称
     */
    private String className;
    /**
     * 方法名称
     */
    private String method;
    /**
     * ip
     */
    private String ip;
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
     * 是否成功
     */
    private String succeed;
    /**
     * 备注
     */
    private String message;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLogDescription() {
        return logDescription;
    }

    public void setLogDescription(String logDescription) {
        this.logDescription = logDescription;
    }

    public String getActionArgs() {
        return actionArgs;
    }

    public void setActionArgs(String actionArgs) {
        this.actionArgs = actionArgs;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    public String getSucceed() {
        return succeed;
    }

    public void setSucceed(String succeed) {
        this.succeed = succeed;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Log{" +
        "id=" + id +
        ", logDescription=" + logDescription +
        ", actionArgs=" + actionArgs +
        ", userName=" + userName +
        ", className=" + className +
        ", method=" + method +
        ", ip=" + ip +
        ", creationTime=" + creationTime +
        ", succeed=" + succeed +
        ", message=" + message +
        "}";
    }
}
