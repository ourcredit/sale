package com.monkey.application.Device;

import com.monkey.core.entity.Point;
import com.monkey.core.mapper.PointRepository;

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
