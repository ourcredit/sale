package com.monkey.service.impl;

import com.monkey.entity.Tree;
import com.monkey.mapper.TreeRepository;
import com.monkey.service.ITreeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-02
 */
@Service
public class TreeServiceImpl extends ServiceImpl<TreeRepository, Tree> implements ITreeService {

}
