package com.monkey.service.impl;

import com.monkey.entity.Order;
import com.monkey.mapper.OrderRepository;
import com.monkey.service.IOrderService;
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
