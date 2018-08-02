package com.monkey.application.Device;

import com.monkey.core.entity.Tree;
import com.baomidou.mybatisplus.service.IService;
import com.monkey.web.controller.dtos.TreeDtoInput;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-02
 */
public interface ITreeService extends IService<Tree> {
            void mutiInsertOrgs(List<TreeDtoInput> input);
}
