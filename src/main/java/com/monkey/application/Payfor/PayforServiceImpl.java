package com.monkey.application.Payfor;

import com.monkey.core.entity.Payfor;
import com.monkey.core.mapper.PayforRepository;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-30
 */
@Service
public class PayforServiceImpl extends ServiceImpl<PayforRepository, Payfor> implements IPayforService {

}
