package com.monkey.application.Menus;

import com.baomidou.mybatisplus.service.IService;
import com.monkey.core.entity.Menu;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
public interface IMenuService extends IService<Menu> {

    /**
     * 根据 Ids 查询
     * @param permissionIds ids
     * @return  权限List
     */
    List<Menu> selectByIds(List<Integer> permissionIds);

    /**
     * 根据角色查询菜单
     * @param roles 角色id 集合
     * @return
     */
    List<Menu> findMenuByRoleId(List<Integer> roles);
    List<Menu> findMenuByUserId(Integer userId);
}
