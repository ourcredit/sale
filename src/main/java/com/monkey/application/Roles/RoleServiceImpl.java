package com.monkey.application.Roles;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.entity.Role;
import com.monkey.core.mapper.RoleRepository;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleRepository, Role> implements IRoleService {

}
