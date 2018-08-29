package com.monkey.application.Device;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.dtos.ProductDto;
import com.monkey.core.entity.Device;
import com.monkey.core.entity.DeviceProduct;
import com.monkey.core.mapper.DeviceProductRepository;
import com.monkey.core.mapper.DeviceRepository;
import com.monkey.web.controller.dtos.DeviceProductInput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
    @Autowired
    private DeviceRepository _deviceRepository;
//
    @Override
    public Page<ProductDto> selectProductsByDevice(Page<ProductDto> page, Integer deviceId, String productName, String productNum, String productType, Integer isSale) {
        List<ProductDto> a=_deviceRepository.selectProductsByDevice(page, deviceId,productName,productNum,productType,isSale);
        return page.setRecords(a) ;
    }

    @Override
    public Page<ProductDto> selectProductsByDeviceId(Page<ProductDto> page, String deviceNum) {
        List<ProductDto> a=_deviceRepository.selectProductsByDeviceId(page, deviceNum);
        return page.setRecords(a) ;
    }



    //设备自注册
    @Override
    public Boolean insertDeviceByApp(Device device) {
        EntityWrapper ew=new EntityWrapper();
        ew.eq("deviceNum",device.getDeviceNum());
       Integer count= baseMapper.selectCount(ew);
       if(count>0)return  false;
      return   _deviceRepository.insert(device) >0;
    }
    @Override
    public Page<Device> selectByArea(Pagination page, String code, Wrapper ew) {
        Page<Device>  p=new Page<>();
        List<Device> r=    _deviceRepository.selectByArea(page,code,ew);
        p.setRecords(r);
        return  p;
    }


}
