package com.monkey.application.Device;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.entity.Category;
import com.monkey.core.mapper.CategoryRepository;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-08-27
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryRepository, Category> implements ICategoryService {

}
