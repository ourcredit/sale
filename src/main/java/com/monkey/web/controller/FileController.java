package com.monkey.web.controller;



import com.monkey.application.files.IFileService;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.common.util.ComUtil;
import com.monkey.common.util.FileUtil;
import com.monkey.core.entity.File;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.BasicErrorController;
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

    @PostMapping
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

