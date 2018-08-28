package com.monkey.core.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-31
 */
@TableName("sale_tenant")
public class Tenant extends Model<Tenant> {

    private static final long serialVersionUID = 1L;
    public  Tenant(){}
    public  Tenant(String name,String displayName){
        this.name=name;
        this.displayName=displayName;
        this.isActive=1;
    }
    /**
     * key
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 显示名
     */
    private String displayName;
    /**
     * 名称
     */
    private String name;
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
     * 1启用  0禁用
     */
    private Integer isActive;
    /**
     * 软删除
     */
    @TableLogic
    private Integer isDeleted;
    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        return "Tenant{" +
        "id=" + id +
        ", displayName=" + displayName +
        ", name=" + name +
        ", creationTime=" + creationTime +
        ", creatorUserId=" + creatorUserId +
        "}";
    }

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }
}
