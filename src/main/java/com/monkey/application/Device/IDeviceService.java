package com.monkey.application.Device;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.monkey.core.dtos.ProductDto;
import com.monkey.core.entity.Device;
import com.baomidou.mybatisplus.service.IService;


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
    Page<ProductDto> selectProductsByDeviceId(Page<ProductDto> page, String deviceNum ) ;
    Boolean insertDeviceByApp(Device device);
    Page<Device> selectByArea(Pagination page, String code, com.baomidou.mybatisplus.mapper.Wrapper w);
}
