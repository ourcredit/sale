package com.monkey.application.Device;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.core.entity.Tree;
import com.monkey.core.mapper.TreeRepository;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.web.controller.dtos.TreeDtoInput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Autowired
    TreeRepository _treeRepository;
    @Override
    public void mutiInsertOrgs(List<TreeDtoInput> input) {
        EntityWrapper<Tree> ew=new EntityWrapper<>();
        _treeRepository.delete(ew);
        insert(input,null);
        return;
    }
    private  void insert(List<TreeDtoInput> input,Integer parentId){
        for (int i = 0; i < input.size(); i++) {
            TreeDtoInput m=input.get(i);
            Tree tr=new Tree(m.name,parentId);
            _treeRepository.insert(tr);
            if(m.children.size()>0){
                insert(m.children,tr.getId());
            }
        }
    }
}
