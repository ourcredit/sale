package com.monkey.web.controller;



import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.application.Payfor.IPayforService;
import com.monkey.application.files.IFileService;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.common.util.FileUtil;
import com.monkey.core.entity.File;
import com.monkey.core.entity.Payfor;
import com.monkey.core.entity.User;
import com.monkey.web.annotation.CurrentUser;
import com.monkey.web.annotation.Log;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author liugh123
 * @since 2018-05-03
 */
@RestController
@RequestMapping("/api/file")
@Api("文件上传接口")
public class FileController  {
    @Autowired
    IFileService _fileService;
    @Autowired
    IPayforService _payforService;
    @PostMapping
    @Log(description="文件接口:/文件上传")
    @ApiOperation(value = "文件接口", notes = "文件上传")
    public PublicResult upload(@RequestParam("files") MultipartFile[] multipartFiles) throws Exception {
        List<File> files = new ArrayList<>();
        if (!ComUtil.isEmpty(multipartFiles) && multipartFiles.length != 0) {
            for (MultipartFile file : multipartFiles) {
                File f = new File();
                String postFix = file.getOriginalFilename().split("//.")[file.getOriginalFilename().split("//.").length - 1];
                int fileType = FileUtil.getFileType(file.getOriginalFilename());
                f.setName(file.getName());
                f.setSize(file.getSize());
                f.setExt(postFix);
                String path = FileUtil.saveFile(file.getInputStream(), fileType, file.getOriginalFilename(), null);
                f.setPath(path);
                files.add(f);
            }
            if(!files.isEmpty()){
                _fileService.insertBatch(files);
            }
        }
        return new PublicResult<List>(PublicResultConstant.SUCCESS, files);
    }
    @Log(description="文件接口:/证书上传")
    @RequestMapping(value = "/pems",method = RequestMethod.POST)
    @ApiOperation(value = "文件接口", notes = "文件上传")
    public PublicResult pems( @RequestParam("files") MultipartFile[] multipartFiles) throws Exception {
        List<File> files = new ArrayList<>();
        if (!ComUtil.isEmpty(multipartFiles) && multipartFiles.length != 0) {
          List<Payfor> l =  _payforService.selectList(new EntityWrapper<>());
            Payfor cur=l.get(0);
            if(cur==null)   return new PublicResult<>(PublicResultConstant.FAILED, "当前商户信息不存在");
            for (MultipartFile file : multipartFiles) {
                String postFix = file.getOriginalFilename().split("//.")[file.getOriginalFilename().split("//.").length - 1];
                int fileType = FileUtil.getFileType(file.getOriginalFilename());
                String path = FileUtil.savePem(cur.getTenantId(), file.getInputStream(), fileType, file.getOriginalFilename(), null);
                cur.setCardUrl(path);
                _payforService.updateAllColumnById(cur);
            }

        }
        return new PublicResult<List>(PublicResultConstant.SUCCESS, files);
    }
    @Log(description="文件接口:/删除文件")
    @DeleteMapping
    public PublicResult delete(@RequestParam("filePaths") List<String> filePaths) {
        if (!ComUtil.isEmpty(filePaths) && filePaths.size() != 0) {
            for (String item : filePaths) {
                if (!FileUtil.deleteUploadedFile(item)) {
                    return new PublicResult<String>(PublicResultConstant.ERROR, null);
                }
            }
        }
        return new PublicResult<String>(PublicResultConstant.SUCCESS, null);
    }
}

