package com.monkey.application.Controls;

import com.monkey.core.entity.Tenant;
import com.baomidou.mybatisplus.service.IService;
/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-31
 */
public interface ITenantService extends IService<Tenant> {
    void insertTenantAdmin(Integer tenantId);
}
