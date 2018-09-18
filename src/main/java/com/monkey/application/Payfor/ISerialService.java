package com.monkey.application.Payfor;

import com.baomidou.mybatisplus.service.IService;
import com.monkey.core.entity.Order;
import com.monkey.core.entity.Serial;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-09-12
 */
public interface ISerialService extends IService<Serial> {
    void  insertBySql(Order order);
}
