package com.monkey.core.dtos;



import com.monkey.core.entity.Userrole;

import java.util.List;

/**
 * @author liugh
 */
public class NgUserModel {
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public UserDto getUser() {
        return user;
    }

    public void setUser(UserDto user) {
        this.user = user;
    }

    private String token;
    private UserDto user;
    private Integer tenantId;

    public NgUserModel() {
    }

    public NgUserModel(String token, UserDto user) {
        this.token = token;
        this.user = user;
    }
    public NgUserModel(String token, UserDto user,Integer tenantId) {
        this.token = token;
        this.user = user;
        this.tenantId=tenantId;
    }
    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
    }
}
