package com.monkey.application.Users.dtos;


import java.util.List;

public class CreateUserInput {
    public Integer id;
    public String account;
    public String password;
    public String userName;
    public String mobile;
    public Integer isActive;
    public List<Integer> roles;
}
