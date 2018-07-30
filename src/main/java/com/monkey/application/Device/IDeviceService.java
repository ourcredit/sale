package com.monkey.application.Device;

import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.core.dtos.ProductDto;
import com.monkey.core.entity.Device;
import com.baomidou.mybatisplus.service.IService;
import com.monkey.core.entity.DeviceProduct;
import com.monkey.web.controller.dtos.DeviceProductInput;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
public interface IDeviceService extends IService<Device> {
    /**
     * @param deviceId
     * @return 商品dto 类
     */
    Page<ProductDto> selectProductsByDevice(Page<ProductDto> page, Integer deviceId , String productName, String productNum, String productType, Integer isSale) ;

}
