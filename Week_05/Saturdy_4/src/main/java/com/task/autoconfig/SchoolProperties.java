package com.task.autoconfig;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @className: SchoolProperties
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/18/2020
 **/
@ConfigurationProperties(prefix = "school")
public class SchoolProperties {
    public static final String NAME = "GEEK TIME";
}
