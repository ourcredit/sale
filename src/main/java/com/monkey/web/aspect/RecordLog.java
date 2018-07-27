package com.monkey.web.aspect;

import com.alibaba.fastjson.JSONObject;

import com.monkey.application.OperationLogs.IOperationLogService;
import com.monkey.common.util.ComUtil;
import com.monkey.common.util.JWTUtil;
import com.monkey.web.annotation.Log;
import com.monkey.web.config.SpringContextBean;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Map;

/**
 * @author liugh
 * @since on 2018/5/10.
 */
public class RecordLog implements AspectApi {

    private Logger logger = LoggerFactory.getLogger(RecordLog.class);

    @Override
    public Object doHandlerAspect(Object [] obj ,ProceedingJoinPoint pjp, Method method,boolean isAll) throws Throwable{
        Log log  = method.getAnnotation( Log.class );
        // 异常日志信息
        String actionLog = null;
        StackTraceElement[] stackTrace =null;
        // 是否执行异常
        boolean isException = false;
        // 接收时间戳
        long endTime;
        // 开始时间戳
        long operationTime = System.currentTimeMillis();
        try {
            if(isAll){
               AspectHandler aspectHandler = new ValidationParamOperate();
               aspectHandler.doAspectHandler(pjp,obj,method,false);
            }
            return pjp.proceed(obj);
        } catch ( Throwable throwable ) {
            isException = true;
            actionLog = throwable.getMessage();
            stackTrace = throwable.getStackTrace();
            throw throwable;
        } finally {
            // 日志处理
            logHandle( pjp , method , log , actionLog , operationTime , isException,stackTrace );
        }
    }

    private void logHandle (ProceedingJoinPoint joinPoint ,
                            Method method ,
                            Log log ,
                            String actionLog ,
                            long startTime  ,
                            boolean isException,
                            StackTraceElement[] stackTrace) {
        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        IOperationLogService operationLogService = SpringContextBean.getBean(IOperationLogService.class);
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        HttpServletRequest request = sra.getRequest();
        String authorization = request.getHeader("Authorization");
        com.monkey.core.entity.Log operationLog = new com.monkey.core.entity.Log();
        if(!ComUtil.isEmpty(authorization)){
            String username = JWTUtil.getUsername(authorization);
            operationLog.setUserName(username);
        }
        operationLog.setIp(getIpAddress(request));
        operationLog.setClassName(joinPoint.getTarget().getClass().getName() );
        operationLog.setCreationTime(new Date(startTime));
        operationLog.setLogDescription(log.description());
        if(isException){
            StringBuilder sb = new StringBuilder();
            sb.append(actionLog+" &#10; ");
            for (int i = 0; i < stackTrace.length; i++) {
                sb.append(stackTrace[i]+" &#10; ");
            }
            operationLog.setMessage(sb.toString());
        }
        operationLog.setMethod(method.getName());
        operationLog.setSucceed(String.valueOf(!isException));
        Object[] args = joinPoint.getArgs();
        StringBuilder sb = new StringBuilder();
        boolean isJoint = false;
        for (int i = 0; i < args.length; i++) {
            if(args[i] instanceof JSONObject){
                JSONObject parse = (JSONObject)JSONObject.parse(args[i].toString());
                if(!ComUtil.isEmpty(parse.getString("passWord"))
                        || !ComUtil.isEmpty(parse.getString("password"))
                        || !ComUtil.isEmpty(parse.getString("passwd"))
                        || !ComUtil.isEmpty(parse.getString("passWd"))){
                    parse.put("passWord","*******");
                }
                if(!ComUtil.isEmpty(parse.getString("passWord"))
                        || !ComUtil.isEmpty(parse.getString("repassword"))
                        || !ComUtil.isEmpty(parse.getString("repasswd"))
                        || !ComUtil.isEmpty(parse.getString("repassWd"))){
                    parse.put("rePassWord","*******");
                }
                operationLog.setActionArgs(parse.toString());
            }else if(args[i] instanceof String
                    || args[i] instanceof Long
                    || args[i] instanceof Integer
                    || args[i] instanceof Double
                    || args[i] instanceof Float
                    || args[i] instanceof Byte
                    || args[i] instanceof Short
                    || args[i] instanceof Character){
                isJoint=true;
            }
            else if(args[i] instanceof String []
                    || args[i] instanceof Long []
                    || args[i] instanceof Integer []
                    || args[i] instanceof Double []
                    || args[i] instanceof Float []
                    || args[i] instanceof Byte []
                    || args[i] instanceof Short []
                    || args[i] instanceof Character []){
                Object[] strs = (Object[])args[i];
                StringBuilder sbArray  =new StringBuilder();
                sbArray.append("[");
                for (Object str:strs) {
                    sbArray.append(str.toString()+",");
                }
                sbArray.deleteCharAt(sbArray.length()-1);
                sbArray.append("]");
                operationLog.setActionArgs(sbArray.toString());
            }else {
                continue;
            }
        }
        if(isJoint){
            Map<String, String[]> parameterMap = request.getParameterMap();
            for (String key:parameterMap.keySet()) {
                String[] strings = parameterMap.get(key);
                for (String str:strings) {
                    sb.append(key+"="+str+"&");
                }
            }
            operationLog.setActionArgs(sb.deleteCharAt(sb.length()-1).toString());
        }
        logger.info("执行方法信息:"+JSONObject.toJSON(operationLog));
        operationLogService.insert(operationLog);
    }


    public  String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip+":"+request.getRemotePort();
    }
}
