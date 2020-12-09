package com.task;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.transaction.jta.JtaAutoConfiguration;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * @className: ShardingJdbcDemoApplication
 * @description: TODO 类描述
 * @author: YM
 * @date: 12/9/2020
 **/
@SpringBootApplication(exclude = JtaAutoConfiguration.class)
public class ShardingJdbcDemoApplication implements CommandLineRunner {
    public static void main(String[] args) {
        SpringApplication.run(ShardingJdbcDemoApplication.class, args);
    }


    @Resource
    private DataSource dataSource;

    @Override
    public void run(String... args) throws Exception {
        System.out.println(dataSource);
    }
}
