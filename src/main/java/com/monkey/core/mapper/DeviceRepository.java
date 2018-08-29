package com.monkey.core.mapper;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.monkey.core.dtos.ProductDto;
import com.monkey.core.entity.Device;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
public interface DeviceRepository extends BaseMapper<Device> {
    /**
     * @param deviceId
     * @return 商品dto 类
     */
    List<ProductDto> selectProductsByDevice(Pagination page, @Param("deviceId") Integer deviceId ,
                                            @Param("name") String productName,
                                            @Param("num") String productNum,
                                            @Param("type") String productType, @Param("sale") Integer isSale) ;

    /**
     * @param deviceNum
     * @return 商品dto 类
     */
    List<ProductDto> selectProductsByDeviceId(Pagination page, @Param("deviceNum") String deviceNum ) ;
    List<Device> selectByArea(Pagination page, @Param("code")String code, @Param("ew") com.baomidou.mybatisplus.mapper.Wrapper w);
}
