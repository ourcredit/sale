package com.monkey.core.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.monkey.core.dtos.ProductDto;
import com.monkey.core.dtos.RoleDto;
import com.monkey.core.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing123
 * @since 2018-06-05
 */
public interface RoleRepository extends BaseMapper<Role> {
    RoleDto selectRoleAndPermissionsById(@Param("id") Integer id);

}
