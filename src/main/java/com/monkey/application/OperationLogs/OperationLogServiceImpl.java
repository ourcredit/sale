package com.monkey.application.OperationLogs;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.core.entity.Log;
import com.monkey.core.mapper.OperationLogRepository;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 操作日志 服务实现类
 * </p>
 *
 * @author liugh123
 * @since 2018-05-08
 */
@Service
public class OperationLogServiceImpl extends ServiceImpl<OperationLogRepository, Log> implements IOperationLogService {

}
