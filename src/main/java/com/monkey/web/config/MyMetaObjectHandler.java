package com.monkey.web.config;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
import com.monkey.core.entity.User;
import org.apache.ibatis.reflection.MetaObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

public class MyMetaObjectHandler extends MetaObjectHandler  {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private  HttpServletRequest request;
    @Override
    public void insertFill(MetaObject metaObject) {
        Object creationTime = getFieldValByName("creationTime",metaObject);
        Object creatorUserId = metaObject.getValue("creatorUserId");
        logger.info("wwwwwwwwwwwwwwwawdaad@wwwwwwww");
        //获取当前登录用户
        User user = (User) request.getAttribute("currentUser");
        if (null == creationTime) {
            metaObject.setValue("creationTime", new Date());
        }
        if (null == creatorUserId) {
            metaObject.setValue("creatorUserId", user.getId());
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
    insertFill(metaObject);
    }
}
