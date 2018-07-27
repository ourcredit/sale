package com.monkey.web.config;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/**
 * <p>
 * MySql Memory Database config
 * </p>
 *
 * @author Caratacus
 * @date 2017/4/1
 */
@Configuration
@EnableTransactionManagement
public class DBConfig {

    @Bean
    public DataSource dataSource() throws SQLException {
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setDriverClassName("com.mysql.cj.jdbc.Driver");
        hikariConfig.setUsername("root");
        hikariConfig.setPassword("zwy0410");
        hikariConfig.setJdbcUrl("jdbc:mysql://localhost:3306/sale?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC");
//        dataSource.setJdbcUrl();
//        dataSource.setUsername("sa");
//        dataSource.setPassword("");
        return new HikariDataSource(hikariConfig);
    }

    @Bean
    public DataSourceTransactionManager transactionManager(DataSource ds) {
        return new DataSourceTransactionManager(ds);
    }

}