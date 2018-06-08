package com.monkey.application.Menus;



import com.baomidou.mybatisplus.service.IService;
import com.monkey.application.dtos.RoleMenuInput;
import com.monkey.core.entity.Rolemenu;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
public interface IRoleMenuService extends IService<Rolemenu> {
    /**
     * 根据角色ID查询
     * @param roleId    角色ID
     * @return  结果集
     */
    List<Rolemenu> selectByRoleId(Integer roleId);
    /**
     * 添加角色 菜单关系
     * @param input    dto
     * @return  结果集
     */
    Boolean insertRoleMenu(RoleMenuInput input);
}
