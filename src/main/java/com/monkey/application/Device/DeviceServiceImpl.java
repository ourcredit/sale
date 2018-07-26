package com.monkey.service.impl;

import com.monkey.entity.Device;
import com.monkey.mapper.DeviceRepository;
import com.monkey.service.IDeviceService;
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
public class DeviceServiceImpl extends ServiceImpl<DeviceRepository, Device> implements IDeviceService {

}
