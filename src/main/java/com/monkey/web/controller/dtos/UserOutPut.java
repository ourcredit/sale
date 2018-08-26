package com.monkey.web.controller.dtos;

import com.monkey.core.dtos.RoleDto;
import com.monkey.core.dtos.UserDto;
import com.monkey.core.entity.Role;
import com.monkey.core.entity.User;

import java.util.List;

public class UserOutPut {
    public UserOutPut(){}
    public UserOutPut(User u,List<RoleDto> r,List a,List p){
        this.user=u;
        this.role=r;
        this.allPermissions=a;
        this.permissions=p;
    }
    public UserOutPut(User u,List<RoleDto> r,List a,List p,Boolean canBack){
        this.user=u;
        this.role=r;
        this.allPermissions=a;
        this.permissions=p;
        this.canBack=canBack;
    }
    public User user;
    public List<RoleDto> role;
    public List<String> allPermissions;
    public List<String> permissions;
    public Boolean canBack;
}
