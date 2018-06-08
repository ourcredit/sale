package com.monkey.application.Users;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import com.monkey.application.Roles.IUserRoleService;
import com.monkey.application.Users.dtos.CreateUserInput;
import com.monkey.core.dtos.UserDto;
import com.monkey.core.entity.User;
import com.monkey.core.entity.Userrole;
import com.monkey.core.mapper.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserRepository, User> implements IUserService {

    @Autowired
    private IUserRoleService _userRoleRepository;
    @Autowired
    private UserRepository _userRepository;

    /**
     * <p>
     * 根据用户名获取用户
     * </p>
     *
     * @param username 用户名
     * @since 2018-05-03
     */
    @Override
    @Cacheable(value = "userName", key = "'user_'.concat(#root.args[0])")
    public User getUserByUserName(String username) {
        EntityWrapper<User> ew = new EntityWrapper<>();
        ew.where("username={0}", username);
        return this.selectOne(ew);

    }
    public UserDto selectUserRole(Integer id){
      return   _userRepository.selectUserRole(id);
}

    /**
     * <p>
     * 创建用户角色信息
     * </p>
     *
     * @param input dto
     * @since 2018-05-03
     */
    public void ModifyUserAndRoles(CreateUserInput input){
        User u;
        EntityWrapper ew=  new EntityWrapper<>();
        ew.eq("account",input.account);
        if(input.id==null){
            u=new User(input.account,input.password,input.userName,input.mobile,input.isActive);
           Boolean r= this.insert(u);
           if(r){
                u=this.selectOne(ew);
           }
        }else {
            u=this.selectOne(ew);
            if(u!=null){
                u.setMobile(input.mobile);
                u.setIsActive(input.isActive);
                u.setUserName(input.userName);
                u.setPassword( BCrypt.hashpw(input.password,BCrypt.gensalt()) );
                this.updateById(u);
            }
        }
        if(!input.roles.isEmpty()){
            ew=  new EntityWrapper<>();
            ew.eq("userId",u.getId());
            _userRoleRepository.delete(ew);
            List<Userrole> urs=new ArrayList<>();
           for (Integer r :input.roles){
               urs.add(new Userrole(u.getId(),r));
           }
           _userRoleRepository.insertBatch(urs);
        }
    }

    /**
     * <p>
     * 注册
     * </p>
     *
     * @param user  用户
     * @param roles 角色ids
     * @since 2018-05-03
     */
    @Override
    public boolean register(User user, List<Integer> roles) {
        boolean result = this.insert(user);
        if (result) {
            List<Userrole> ur = new ArrayList<>();
            for (Integer roleId : roles) {
                ur.add(new Userrole(user.getId(), roleId));
            }
            _userRoleRepository.insertBatch(ur);
        }
        return result;
    }
}
