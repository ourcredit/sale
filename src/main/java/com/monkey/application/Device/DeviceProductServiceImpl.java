package com.monkey.application.Device;

import com.monkey.core.entity.DeviceProduct;
import com.monkey.core.mapper.DeviceProductRepository;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.web.controller.dtos.DeviceProductInput;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
    @Override
    public Boolean updateProducts(List<DeviceProductInput> input) {
        if(input.isEmpty())return  false;
        List<DeviceProduct> list=new ArrayList<>();
        for (int i = 0; i < input.size(); i++) {
            DeviceProductInput c=input.get(i);
            DeviceProduct d=new DeviceProduct(c.id, c.productId,c.deviceId,c.isSale,c.price);
            list.add(d);
        }
     return this.insertOrUpdateBatch(list);
    }
}
