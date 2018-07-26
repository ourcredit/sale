package com.monkey.application.Device;

import com.monkey.core.entity.DeviceProduct;
import com.monkey.core.mapper.DeviceProductRepository;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@Service
public class DeviceProductServiceImpl extends ServiceImpl<DeviceProductRepository, DeviceProduct> implements IDeviceProductService {

}
