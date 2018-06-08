package com.monkey.application.Menus;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import com.monkey.application.dtos.RoleMenuInput;
import com.monkey.core.entity.Rolemenu;
import com.monkey.core.mapper.RolemenuRepository;
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
public class RoleMenuServiceImpl extends ServiceImpl<RolemenuRepository, Rolemenu> implements IRoleMenuService {

    @Override
  //  @Cacheable(value = "RoleToMenuServiceImpl:selectByRoleId", key = "'role_'.concat(#root.args[0])")
    public List<Rolemenu> selectByRoleId(Integer roleId) {
        EntityWrapper<Rolemenu> ew = new EntityWrapper<>();
        ew.where("role_id={0}", roleId);
        return this.selectList(ew);
    }

    @Override
    public Boolean insertRoleMenu(RoleMenuInput input) {
        EntityWrapper<Rolemenu> ew = new EntityWrapper<>();
        ew.where("id={0}", input.roleId);
        this.delete(ew);
        List<Rolemenu> urs=new ArrayList<>();
        for (Integer r : input.menus){
            Rolemenu u=new Rolemenu(input.roleId,r);
            urs.add(u);
        }
        return  this.insertBatch(urs);
    }
}
