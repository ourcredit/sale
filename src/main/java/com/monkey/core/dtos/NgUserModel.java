package com.monkey.core.dtos;



import com.monkey.core.entity.Userrole;

import java.util.List;

/**
 * @author liugh
 */
public class NgUserModel {
    private String token;
    private String name;
    private Integer id;
    private Long time;
    private List<Userrole> roleId;
    private String avatar;
    private String telephone;

    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }

    public List<Userrole> getRoleId() {
        return roleId;
    }

    public void setRoleId(List<Userrole> roleId) {
        this.roleId = roleId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }


    public NgUserModel() {
    }

    public NgUserModel(String token, String name, Integer id, Long time,
                       List<Userrole> roleId, String avatar, String telephone) {
        this.token = token;
        this.name = name;
        this.id = id;
        this.time = time;
        this.roleId = roleId;
        this.avatar = avatar;
        this.telephone = telephone;
    }
}
