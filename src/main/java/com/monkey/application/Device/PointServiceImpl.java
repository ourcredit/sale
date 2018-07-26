package com.monkey.service.impl;

import com.monkey.entity.Point;
import com.monkey.mapper.PointRepository;
import com.monkey.service.IPointService;
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
public class PointServiceImpl extends ServiceImpl<PointRepository, Point> implements IPointService {

}
