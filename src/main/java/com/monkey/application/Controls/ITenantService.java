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
    // 创建租户下默认的管理员和角色以及菜单信息等
    void createTenantAndUserRoles(Integer tenantId);
}
