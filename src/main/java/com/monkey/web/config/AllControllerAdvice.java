package com.monkey.web.config;


import com.monkey.common.base.BaseResult;
import com.monkey.common.base.PublicResult;
import com.monkey.common.base.PublicResultConstant;
import com.monkey.web.exception.ParamJsonException;
import com.monkey.web.exception.UnauthorizedException;
import org.apache.shiro.ShiroException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.exceptions.TemplateInputException;

/**
 * Controller统一异常处理
 * @author : liugh
 * @date : 2018/05/08
 */
@ControllerAdvice
public class AllControllerAdvice {
    private static Logger logger = LoggerFactory.getLogger(AllControllerAdvice.class);

    /**
     * 应用到所有@RequestMapping注解方法，在其执行之前初始化数据绑定器
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
    }

    /**
     * 把值绑定到Model中，使全局@RequestMapping可以获取到该值
     */
    @ModelAttribute
    public void addAttributes(Model model) {
    }

    /**
     * 全局异常捕捉处理
     */
    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public PublicResult<String> errorHandler(Exception ex) {
        ex.printStackTrace();
        logger.error("接口出现严重异常：{}", ex.getMessage());
        return new PublicResult<>(PublicResultConstant.FAILED, null);
    }

    /**
     * 捕捉UnauthorizedException
     * @return
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(UnauthorizedException.class)
    @ResponseBody
    public PublicResult<String> handle401() {
        return new PublicResult<>(PublicResultConstant.USER_NO_PERMITION, null);
    }

    /**
     * 捕捉shiro的异常
     * @param e
     * @return
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(ShiroException.class)
    @ResponseBody
    public PublicResult<String> handle401(ShiroException e) {
        return new PublicResult<>(PublicResultConstant.USER_NO_PERMITION, null);
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(TemplateInputException.class)
    @ResponseBody
    public PublicResult<String> handle401(TemplateInputException e) {
        return new PublicResult<>(PublicResultConstant.USER_NO_PERMITION, null);
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(value = ParamJsonException.class)
    @ResponseBody
    public BaseResult<String> handleParam(Exception e) {
        if(e instanceof ParamJsonException) {
            logger.info("参数错误："+e.getMessage());
            return new BaseResult<>(PublicResultConstant.PARAM_ERROR.getResult(), e.getMessage(),null);
        }
        return new PublicResult<>(PublicResultConstant.ERROR, null);
    }


}