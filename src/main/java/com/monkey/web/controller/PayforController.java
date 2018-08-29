package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Payfor.IPayforService;
import com.monkey.common.base.PermissionConst;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.core.entity.Payfor;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-30
 */
@RestController
@RequestMapping("api/payfor")
@RequiresPermissions(value = {})
public class PayforController {
    @Autowired
    IPayforService _payforService;


    @ApiOperation(value = "获取支付设置详情",notes = "支付信息列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    @RequiresPermissions(value = {PermissionConst._paySetting._pay.first})
    public PublicResult<Payfor> Device(@PathVariable Integer id) throws Exception{
        EntityWrapper ew=new EntityWrapper();
        Payfor m=_payforService.selectOne(ew);
        if(m==null){
            m=new Payfor();
            m.setOperatorId(id);
        }
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }
    @ApiOperation(value = "添加或编辑支付设置",notes = "支付信息列表")
    @RequestMapping(method = RequestMethod.PUT)
    @RequiresPermissions(value = {PermissionConst._paySetting._pay.modify})
    public PublicResult<Object> insert(@RequestBody Payfor model) throws Exception{
        Boolean r=_payforService.insertOrUpdate(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

}

