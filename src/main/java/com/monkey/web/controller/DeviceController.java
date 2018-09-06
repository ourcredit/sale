package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Device.IDeviceProductService;
import com.monkey.application.Device.IDeviceService;
import com.monkey.application.Device.IPointService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.Constant;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.dtos.ProductDto;
import com.monkey.core.entity.Device;
import com.monkey.core.entity.User;
import com.monkey.web.annotation.CurrentUser;
import com.monkey.web.annotation.Log;
import com.monkey.web.annotation.Pass;
import com.monkey.web.controller.dtos.DeviceProductInput;
import com.monkey.web.controller.dtos.ProductInput;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;
import scala.Product;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@RestController
@RequestMapping("api/device")
@RequiresPermissions(value = {})
public class DeviceController {
    @Autowired
    IDeviceService _deviceService;
    @Autowired
    IPointService _pointService;
    @Autowired
    IDeviceProductService _deviceProductService;

    @ApiOperation(value = "获取设备列表",notes = "设备列表")
    @RequestMapping(value = "",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._devices._device.list})
    public PublicResult<Page<Device>> devices(@RequestBody PagedAndFilterInputDto page) throws Exception{
        EntityWrapper<Device> filter = new EntityWrapper<>();
        filter=  ComUtil.genderFilter(filter,page.where);
        String code=  (String)page.where.get("code");
        if(code!=null&&!code.isEmpty()){
            if(code.equals(Constant.UnknownCode)){
                filter.eq("pointName",null).or("pointName=''");
            }else {
                List<Integer> ids=   _pointService.selectPointIdsByCode(code);
                if(!ids.isEmpty()){
                    filter.in("pointId",ids);
                }
            }

        }

        Page<Device> res= _deviceService.selectPage(new Page<>(page.index,page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取设备详情",notes = "设备列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._devices._device.first})
    public PublicResult<Device> Device(@PathVariable Integer id) throws Exception{
        Device m=_deviceService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }
    @Log(description="设备接口:/上位机自动注册")
    @ApiOperation(value = "设备自注册",notes = "设备列表")
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @Pass
    public PublicResult<Boolean> register(@RequestBody Device model){
        Boolean r=_deviceService.insertDeviceByApp(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

    @ApiOperation(value = "添加或编辑设备",notes = "设备列表")
    @RequestMapping(method = RequestMethod.PUT)
    @RequiresPermissions(value = {PermissionConst._devices._device.modify})
    public PublicResult<Object> insert(@RequestBody Device model) throws Exception{
        Boolean r=_deviceService.insertOrUpdate(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "删除设备",notes = "设备列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    @RequiresPermissions(value = {PermissionConst._devices._device.delete})
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception{
        Boolean r=_deviceService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "批量删除设备",notes = "设备列表")
    @RequestMapping(value = "/batch",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._devices._device.batch})
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception{
        Boolean r=_deviceService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }


    @ApiOperation(value = "获取设备下商品配置列",notes = "设备列表")
    @RequestMapping(value = "/products",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._devices._device.getDeviceProduct})
    public PublicResult<Page<ProductDto>> get_products_by_device(@RequestBody ProductInput page) throws Exception{
        Page<ProductDto> res= _deviceService.selectProductsByDevice(new Page<>(page.index,page.size),page.deviceId, page.productName,page.productNum,page.productType,page.isSale);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取设备下商品售卖列表",notes = "设备列表")
    @RequestMapping(value = "/salelist",method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._devices._device.getDeviceProduct})
    public PublicResult<Page<ProductDto>> getProductsbydeviceId(@RequestBody ProductInput page) throws Exception{
        Page<ProductDto> res= _deviceService.selectProductsByDeviceId(new Page<>(page.index,page.size),page.deviceNum);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @Log(description="设备接口:/批量更新商品")
    @ApiOperation(value = "批量更新商品",notes = "设备列表")
    @RequestMapping(value = "/products",method = RequestMethod.PUT)
    @RequiresPermissions(value = {PermissionConst._devices._device.allow})
    public PublicResult<Boolean> put_products_by_device(@RequestBody List<DeviceProductInput> page) throws Exception{
     Boolean r=   _deviceProductService.updateProducts(page);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
}

