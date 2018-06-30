package com.monkey.core.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhaohejing123
 * @since 2018-06-05
 */
@TableName("sale_role")
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;
    public Role(){}
    public Role(Integer id, String roleName,String displayName,Integer isActive,Integer isStatic){
        this.id=id;
        this.roleName=roleName;
        this.displayName=displayName;
        this.isActive=isActive;
        this.isStatic=isStatic;
        this.creationTime=new Date();
        this.isDeleted=0;
    }
    /**
     * 软删除
     */
    @TableLogic
    private Integer isDeleted;
    /**
     * key
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * name
     */
    private String roleName;
    private String description;
    /**
     * 显示名
     */
    private String displayName;
    /**
     * 创建时间
     */
    private Date creationTime;
    /**
     * 创建人id
     */
    private Integer creatorUserId;

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }

    public Integer getIsStatic() {
        return isStatic;
    }

    public void setIsStatic(Integer isStatic) {
        this.isStatic = isStatic;
    }

    private Integer isActive;
    private  Integer isStatic;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
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
        return "Role{" +
        "id=" + id +
        ", roleName=" + roleName +
        ", displayName=" + displayName +
        ", creationTime=" + creationTime +
        ", creatorUserId=" + creatorUserId +
        "}";
    }



    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
