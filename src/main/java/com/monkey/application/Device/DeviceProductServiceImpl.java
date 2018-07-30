package com.monkey.service.impl;

import com.monkey.entity.DeviceProduct;
import com.monkey.mapper.DeviceProductRepository;
import com.monkey.service.IDeviceProductService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-27
 */
@Service
public class DeviceProductServiceImpl extends ServiceImpl<DeviceProductRepository, DeviceProduct> implements IDeviceProductService {

}
