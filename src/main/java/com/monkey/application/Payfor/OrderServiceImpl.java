package com.monkey.application.Payfor;

import com.monkey.core.entity.Order;
import com.monkey.core.mapper.OrderRepository;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-13
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderRepository, Order> implements IOrderService {

}
