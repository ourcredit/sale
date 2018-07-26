package com.monkey.core.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import org.mindrot.jbcrypt.BCrypt;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@TableName("sale_user")
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;
    public  User(){}
    public  User(String account,String password,String userName,String mobile,Integer isActive){
        this.account=account;
        this.password=BCrypt.hashpw(password,BCrypt.gensalt());
        this.userName=userName;
        this.mobile=mobile;
        this.isActive=isActive;
        this.creationTime=new Date();
    }
    /**
     * 自增主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 账户
     */
    private String account;
    /**
     * 密码
     */
    private String password;
    /**
     * 创建时间
     */
    private Date creationTime;
    /**
     * 创建人id
     */
    private Integer creatorUserId;
    /**
     * 姓名
     */
    private String userName;
    /**
     * 手机
     */
    private String mobile;
    /**
     * 1启用  0禁用
     */
    private Integer isActive;
    /**
     * 软删除  
     */
    private Integer isDeleted;
    /**
     * 最后登陆时间
     */
    private Date lastLoginTime;
    /**
     * 是否运营商
     */
    private Integer isOperator;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Integer getIsOperator() {
        return isOperator;
    }

    public void setIsOperator(Integer isOperator) {
        this.isOperator = isOperator;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "User{" +
        "id=" + id +
        ", account=" + account +
        ", password=" + password +
        ", creationTime=" + creationTime +
        ", creatorUserId=" + creatorUserId +
        ", userName=" + userName +
        ", mobile=" + mobile +
        ", isActive=" + isActive +
        ", isDeleted=" + isDeleted +
        ", lastLoginTime=" + lastLoginTime +
        ", isOperator=" + isOperator +
        "}";
    }
}
