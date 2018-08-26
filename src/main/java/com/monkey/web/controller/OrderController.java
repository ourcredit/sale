package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Payfor.IOrderService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.common.wechatsdk.QrCodeUtil;
import com.monkey.core.entity.Order;
import com.monkey.web.aspect.WebSocketServer;
import com.monkey.web.controller.dtos.OrderInput;
import com.monkey.web.controller.dtos.RequestDateDto;
import com.monkey.web.controller.dtos.WebSocketMessage;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@RestController
@RequestMapping("api/order")
public class OrderController {
    @Autowired
    IOrderService _orderService;

    @ApiOperation(value = "获取订单列表", notes = "订单列表")
    @RequestMapping(value = "", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._order.list})
    public PublicResult<Page<Order>> orders(@RequestBody PagedAndFilterInputDto page) throws Exception {
        EntityWrapper<Order> filter = new EntityWrapper<>();
        filter = ComUtil.genderFilter(filter, page.where);
        Page<Order> res = _orderService.selectPage(new Page<>(page.index, page.size), filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }

    @ApiOperation(value = "获取订单详情", notes = "订单列表")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._order.show})
    public PublicResult<Order> Product(@PathVariable Integer id) throws Exception {
        Order m = _orderService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }

    @ApiOperation(value = "客户下单操作", notes = "订单列表")
    @RequestMapping(value = "/make", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._order.list})
    public PublicResult<Object> insert(@RequestBody OrderInput model) throws Exception {
        try {
            Order r = _orderService.insertOrder(model);
            if (!r.getId().isEmpty()) {
                String code = _orderService.weixinPay(r);
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

    @ApiOperation(value = "退款操作", notes = "订单列表")
    @RequestMapping(value = "/back/{orderId}", method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._order.list})
    public PublicResult<Object> back(@PathVariable String orderId) throws Exception {
        try {
            Order r = _orderService.selectById(orderId);
            if (r != null) {
                _orderService.weixinBack(r);
                return new PublicResult<>(PublicResultConstant.SUCCESS, "退款申请请求成功");
            }
            return new PublicResult<>(PublicResultConstant.ERROR, "暂无此订单信息");
        } catch (Exception e) {
            return new PublicResult<>(PublicResultConstant.FAILED, e.getMessage());
        }
    }
    @ApiOperation(value = "获取首页统计", notes = "订单列表")
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._order.list})
    public PublicResult<Object> staticals() throws Exception {
        try {
            Map r = _orderService.getDashboard();
            if (r != null) {
                return new PublicResult<>(PublicResultConstant.SUCCESS, r);
            }
            return new PublicResult<>(PublicResultConstant.ERROR, "获取统计失败");
        } catch (Exception e) {
            return new PublicResult<>(PublicResultConstant.FAILED, e.getMessage());
        }
    }
    @ApiOperation(value = "获取首页统计", notes = "订单列表")
    @RequestMapping(value = "/total", method = RequestMethod.POST)
    @RequiresPermissions(value = {PermissionConst._order.list})
    public PublicResult<Object> todays(@RequestBody RequestDateDto input) throws Exception {
        try {
            Map r = _orderService.getStaticial(input.start,input.end);
            if (r != null) {
                return new PublicResult<>(PublicResultConstant.SUCCESS, r);
            }
            return new PublicResult<>(PublicResultConstant.ERROR, "获取统计失败");
        } catch (Exception e) {
            return new PublicResult<>(PublicResultConstant.FAILED, e.getMessage());
        }
    }
}

