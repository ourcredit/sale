package com.monkey.application.Controls;

import com.monkey.core.entity.Tenant;
import com.monkey.core.mapper.TenantRepository;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-31
 */
@Service
public class TenantServiceImpl extends ServiceImpl<TenantRepository, Tenant> implements ITenantService {

}
