package com.monkey.core.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.monkey.core.entity.Menu;
import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhaohejing123
 * @since 2018-06-05
 */
public interface MenuRepository extends BaseMapper<Menu> {
    List<Menu> selectCurrentMenus(@Param("userId") Integer userId) ;


}
