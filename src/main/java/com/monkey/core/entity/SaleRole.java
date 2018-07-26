package com.monkey.core.entity;

import java.util.Date;

/**
 * (SaleRole)表实体类
 *
 * @author makejava
 * @since 2018-07-25 14:33:38
 */
public class SaleRole {
    //key
    private Integer id;
    //name
    private String rolename;
    //显示名
    private String displayname;
    //创建时间
    private Date creationtime;
    //创建人id
    private Integer creatoruserid;
    //启用状态
    private Object isactive;
    //是否静态
    private Object isstatic;
    //描述
    private String description;
    
    private Integer isdeleted;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    public Date getCreationtime() {
        return creationtime;
    }

    public void setCreationtime(Date creationtime) {
        this.creationtime = creationtime;
    }

    public Integer getCreatoruserid() {
        return creatoruserid;
    }

    public void setCreatoruserid(Integer creatoruserid) {
        this.creatoruserid = creatoruserid;
    }

    public Object getIsactive() {
        return isactive;
    }

    public void setIsactive(Object isactive) {
        this.isactive = isactive;
    }

    public Object getIsstatic() {
        return isstatic;
    }

    public void setIsstatic(Object isstatic) {
        this.isstatic = isstatic;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Integer isdeleted) {
        this.isdeleted = isdeleted;
    }

}