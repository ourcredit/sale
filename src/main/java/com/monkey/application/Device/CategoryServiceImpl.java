package com.monkey.service.impl;

import com.monkey.entity.Category;
import com.monkey.mapper.CategoryRepository;
import com.monkey.service.ICategoryService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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
