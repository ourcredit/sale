package com.monkey.web.config;

import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
import com.monkey.core.entity.User;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
/**
 * 自定义填充处理器
 */
public class MyMetaObjectHandler extends MetaObjectHandler {
    @Autowired
    private  HttpServletRequest request;
    @Override
    public void insertFill(MetaObject metaObject) {
        Object creationTime = getFieldValByName("creationTime",metaObject);
        Object creatorUserId = metaObject.getValue("creatorUserId");
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
    public boolean openUpdateFill() {
        return false;
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        // 关闭更新填充、这里不执行
    }
}