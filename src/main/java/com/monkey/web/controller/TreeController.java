package com.monkey.web.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.application.Device.IDeviceService;
import com.monkey.application.Device.ITreeService;
import com.monkey.application.dtos.PagedAndFilterInputDto;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.core.entity.Tree;
import com.monkey.web.controller.dtos.TreeDtoInput;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-02
 */
@RestController
@RequestMapping("api/tree")
@RequiresPermissions(value = {})
public class TreeController {
    @Autowired
    ITreeService _treeService;
    @Autowired
    IDeviceService _deviceService;
    @ApiOperation(value = "获取机构列表",notes = "机构列表")
    @RequestMapping(value = "",method = RequestMethod.POST)
    public PublicResult<List<Tree>> Trees(@RequestBody PagedAndFilterInputDto page) throws Exception{
        EntityWrapper<Tree> filter = new EntityWrapper<>();
        filter=  ComUtil.genderFilter(filter,page.where);
        List<Tree> res= _treeService.selectList( filter);
        return new PublicResult<>(PublicResultConstant.SUCCESS, res);
    }
    @ApiOperation(value = "获取机构详情",notes = "机构列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public PublicResult<Tree> Tree(@PathVariable Integer id) throws Exception{
        Tree m=_treeService.selectById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, m);
    }
    @ApiOperation(value = "批量添加机构",notes = "机构列表")
    @RequestMapping(value = "batch",method = RequestMethod.PUT)
    public PublicResult<Object> mutiInsert(@RequestBody List<TreeDtoInput> model) throws Exception{
        _treeService.mutiInsertOrgs(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, true);
    }
    @ApiOperation(value = "添加或编辑机构",notes = "机构列表")
    @RequestMapping(method = RequestMethod.PUT)
    public PublicResult<Object> insert(@RequestBody Tree model) throws Exception{
        Boolean r=_treeService.insertOrUpdate(model);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "删除机构",notes = "机构列表")
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public PublicResult<Object> delete(@PathVariable Integer id) throws Exception{
        EntityWrapper ew=new EntityWrapper();
        ew.eq("areaId",id);
         Integer count=   _deviceService.selectCount(ew);
         if(count>0)   return new PublicResult<>(PublicResultConstant.FAILED, "该机构下有设备存在无法删除");
        Boolean r=_treeService.deleteById(id);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }
    @ApiOperation(value = "批量删除机构",notes = "机构列表")
    @RequestMapping(value = "/batch",method = RequestMethod.POST)
    public PublicResult<Object> batchdelete(@RequestBody List<Integer> ids) throws Exception{
        Boolean r=_treeService.deleteBatchIds(ids);
        return new PublicResult<>(PublicResultConstant.SUCCESS, r);
    }

}

