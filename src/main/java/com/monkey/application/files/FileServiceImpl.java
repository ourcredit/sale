package com.monkey.application.files;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.entity.File;
import com.monkey.core.mapper.FileRepository;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing123
 * @since 2018-06-07
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileRepository, File> implements IFileService {

}
