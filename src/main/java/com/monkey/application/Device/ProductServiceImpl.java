package com.monkey.service.impl;

import com.monkey.entity.Product;
import com.monkey.mapper.ProductRepository;
import com.monkey.service.IProductService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2018-07-26
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductRepository, Product> implements IProductService {

}
