package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Device.IPointService;
import com.monkey.application.Payfor.IMainorderService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.Constant;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.common.wechatsdk.QrCodeUtil;
import com.monkey.core.entity.Mainorder;
import com.monkey.web.annotation.Log;
import com.monkey.web.controller.dtos.OrderInput;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@RestController
@RequestMapping("api/mainorder")
public class MainorderController {
    @Autowired
    IMainorderService _orderService;
    @Autowired
    IPointService _pointService;

    @ApiOperation(value = "获取订单列表", notes = "订单列表")
    @RequestMapping(value = "", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._orders._order.list})
    public PublicResult<Page<Mainorder>> orders(@RequestBody PagedAndFilterInputDto page) throws Exception {
        EntityWrapper<Mainorder> filter = new EntityWrapper<>();
        filter = ComUtil.genderFilter(filter, page.where);
        String code = (String) page.where.get("code");
        if (code != null && !code.isEmpty()) {
            if(code.equals(Constant.UnknownCode)){
                filter.where("pointName is null").or("pointName=''");
            }else{
                List<String> ids= _pointService.selectPointNameByCode(code);
                if(!ids.isEmpty()){
                    filter.in("pointName",ids);
                }
            }
        }
        Page<Mainorder> res = _orderService.selectPage(new Page<>(page.index, page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取订单详情", notes = "订单列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._orders._order.list})
    public PublicResult<Mainorder> Product(@PathVariable Integer id) throws Exception {
        Mainorder m = _orderService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }
    @Log(description = "订单接口:/客户下单操作")
    @ApiOperation(value = "客户下单操作", notes = "订单列表")
    @RequestMapping(value = "/make", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._orders._order.list})
    public PublicResult<Object> insert(@RequestBody OrderInput model) throws Exception {
        try {
            Mainorder r = _orderService.insertOrder(model);
            if (!r.getId().isEmpty()) {
                String code = "";
                if (model.isWechatOrder) {
                    code = _orderService.weixinPay(r);
                } else {
                    code = _orderService.aliPay(r);
                }
                if (!code.isEmpty()) {
                    String url = QrCodeUtil.make(code);
                    return new PublicResult<>(PublicResultConstant.SUCCESS, url);
                }
                return new PublicResult<>(PublicResultConstant.ERROR, "生成支付二维码失败");
            }
            return new PublicResult<>(PublicResultConstant.ERROR, r);
        } catch (Exception e) {
            return new PublicResult<>(PublicResultConstant.FAILED, e.getMessage());
        }
    }

    @Log(description = "订单接口:/退款操作")
    @ApiOperation(value = "退款操作", notes = "订单列表")
    @RequestMapping(value = "/back/{orderId}", method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._orders._order.back})
    public PublicResult<Object> back(@PathVariable String orderId) throws Exception {
        try {
            Mainorder r = _orderService.selectById(orderId);
            if (r != null) {
                String result = "";
                if (r.getPayType() == 1) {
                    result = _orderService.weixinBack(r);
                } else {
                    result = _orderService.aliback(r);
                }
                if (result.isEmpty()) return new PublicResult<>(PublicResultConstant.FAILED, "退款申请请求失败");
                return new PublicResult<>(PublicResultConstant.SUCCESS, "退款申请请求成功");
            }
            return new PublicResult<>(PublicResultConstant.ERROR, "暂无此订单信息");
        } catch (Exception e) {
            return new PublicResult<>(PublicResultConstant.FAILED, e.getMessage());
        }
    }

}
