package com.monkey.application.Device;

import com.monkey.core.entity.Product;
import com.monkey.core.mapper.ProductRepository;

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
