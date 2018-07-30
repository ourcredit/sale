package com.monkey.application.Device;

import com.monkey.core.entity.DeviceProduct;
import com.baomidou.mybatisplus.service.IService;
import com.monkey.web.controller.dtos.DeviceProductInput;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-27
 */
public interface IDeviceProductService extends IService<DeviceProduct> {
    Boolean updateProducts(List<DeviceProductInput> input);

}
