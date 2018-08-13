package com.monkey.web.config;

import com.baomidou.mybatisplus.entity.GlobalConfiguration;
import com.baomidou.mybatisplus.mapper.ISqlInjector;
import com.baomidou.mybatisplus.mapper.LogicSqlInjector;
import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.plugins.PerformanceInterceptor;
import com.baomidou.mybatisplus.plugins.parser.ISqlParser;
import com.baomidou.mybatisplus.plugins.parser.tenant.TenantHandler;
import com.baomidou.mybatisplus.plugins.parser.tenant.TenantSqlParser;
import com.baomidou.mybatisplus.toolkit.PluginUtils;
import com.monkey.core.entity.User;
import net.sf.jsqlparser.expression.LongValue;
import org.apache.ibatis.mapping.MappedStatement;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import net.sf.jsqlparser.expression.Expression;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liugh
 * @since 2018-03-21
 */
@EnableTransactionManagement
@Configuration
@MapperScan("com.monkey.core.mapper")
public class MybatisPlusConfig {
    @Bean
    public GlobalConfiguration globalConfiguration() {
        GlobalConfiguration conf = new GlobalConfiguration(new LogicSqlInjector());
        conf.setLogicDeleteValue("-1");
        conf.setLogicNotDeleteValue("0");
        conf.setIdType(2);
        return conf;
    }
    /**
     * mybatis-plus分页插件<br>
     * 文档：http://mp.baomidou.com<br>
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        // 开启 PageHelper 的支持
        paginationInterceptor.setLocalPage(true);
        /*
         * 【测试多租户】 SQL 解析处理拦截器<br>
         * 这里固定写成住户 1 实际情况你可以从cookie读取，因此数据看不到 【 麻花藤 】 这条记录（ 注意观察 SQL ）<br>
         */
        List<ISqlParser> sqlParserList = new ArrayList<>();
        TenantSqlParser tenantSqlParser = new TenantSqlParser();

        tenantSqlParser.setTenantHandler(new TenantHandler() {
            @Override
            public Expression getTenantId() {
                //获取当前登录用户
                ServletRequestAttributes s = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
                Integer tenantId=1;
                if (s != null) {
                    Object token =  s.getAttribute("currentUser",0);
                    if(token==null){
                        tenantId=1;
                    }else {
                        User u=(User)token;
                        tenantId = u.getTenantId();
                    }
                }
                return new LongValue(tenantId);
            }

            @Override
            public String getTenantIdColumn() {
                return "tenantId";
            }

            @Override
            public boolean doTableFilter(String tableName) {
                List<String> nolist = new ArrayList<String>() {{
                    add("sale_tenant");
                    add("sale_menu");
                    add("sale_log");
                }};
                // 这里可以判断是否过滤表
                if (nolist.contains(tableName)) {
                    return true;
                }
                return false;
            }
        });
        sqlParserList.add(tenantSqlParser);
        paginationInterceptor.setSqlParserList(sqlParserList);
        paginationInterceptor.setSqlParserFilter(metaObject -> {
            List<String> queryList = new ArrayList<String>() {{
                add("com.monkey.core.mapper.UserRepository.selectByTenantAndAccount");
                add("com.monkey.core.mapper.TenantRepository.insertTenantAdmin");
                add("com.monkey.core.mapper.TenantRepository.insertTenantRole");
                add("com.monkey.core.mapper.TenantRepository.insertTenantMenus");
                add("com.monkey.core.mapper.TenantRepository.insertTenantAdminRoles");
                add("com.monkey.core.mapper.TenantRepository.selectTenantRoles");
                add("com.monkey.core.mapper.UserRepository.selectByTenantAndName");
            }};
            MappedStatement ms = PluginUtils.getMappedStatement(metaObject);
            // 过滤自定义查询此时无租户信息约束【 麻花藤 】出现
            if (queryList.contains(ms.getId())) {
                return true;
            }
            return false;
        });
        return paginationInterceptor;
    }

    /***
     * SQL执行效率插件【生产环境可以关闭】
     * plus 的性能优化
     * @return
     */
    @Bean
    @Profile({"dev", "test"})
    public PerformanceInterceptor performanceInterceptor() {
        PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();
        /*<!-- SQL 执行性能分析，开发环境使用，线上不推荐。 maxTime 指的是 sql 最大执行时长 -->*/
        performanceInterceptor.setMaxTime(1000);
        /*<!--SQL是否格式化 默认false-->*/
        performanceInterceptor.setFormat(false);
        return performanceInterceptor;
    }

    @Bean
    public MetaObjectHandler metaObjectHandler() {
        return new MyMetaObjectHandler();
    }

    /**
     * 注入sql注入器
     */
    @Bean
    public ISqlInjector sqlInjector() {
        return new LogicSqlInjector();
    }

}