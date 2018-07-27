package com.monkey.web.config;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
import com.monkey.core.entity.User;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
/**
 * 自定义填充处理器
 */
@Component
public class MyMetaObjectHandler extends MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        Object creationTime = getFieldValByName("creationTime",metaObject);
        if (null == creationTime) {
            metaObject.setValue("creationTime", new Date());
        }
        Object creatorUserId = metaObject.getValue("creatorUserId");
       //获取当前登录用户
        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        User user = (User) req.getAttribute("currentUser");

       if (null == creatorUserId&&user!=null) {
            metaObject.setValue("creatorUserId", user.getId());
        }
    }
    @Override
    public boolean openUpdateFill() {
        return false;
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 关闭更新填充、这里不执行
    }
}