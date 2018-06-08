package com.monkey.application.Roles;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import com.monkey.application.dtos.UserRoleInput;
import com.monkey.common.util.ComUtil;
import com.monkey.core.entity.Userrole;
import com.monkey.core.mapper.UserroleRepository;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserroleRepository, Userrole> implements IUserRoleService {

    @Override
   // @Cacheable(value = "UserToRoleServiceImpl:selectByUserId", key = "'user_'.concat(#root.args[0])")
    public List<Userrole> selectByUserId(Integer userId) {
        EntityWrapper<Userrole> ew = new EntityWrapper<>();
        ew.where("userId={0}", userId);
        List<Userrole> userToRoleList = this.selectList(ew);
        return ComUtil.isEmpty(userToRoleList)? null: userToRoleList;
    }
    @Override
    public Boolean  insertUserRoles(UserRoleInput input){
        EntityWrapper<Userrole> ew = new EntityWrapper<>();
        ew.where("id={0}", input.userId);
            this.delete(ew);
        List<Userrole> urs=new ArrayList<>();
        for (Integer r : input.roles){
            Userrole u=new Userrole(input.userId,r);
            urs.add(u);
        }
          return  this.insertBatch(urs);
    }
}
