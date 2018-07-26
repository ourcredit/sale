package com.monkey.application.Device;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.entity.Device;
import com.monkey.core.mapper.DeviceRepository;
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
