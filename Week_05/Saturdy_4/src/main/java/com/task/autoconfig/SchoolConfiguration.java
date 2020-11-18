package com.task.autoconfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @className: SchoolConfiguration
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/18/2020
 **/
@Configuration
@ConditionalOnClass(School.class)
@EnableConfigurationProperties({SchoolProperties.class, Student.class})
@ConditionalOnProperty(prefix = "school", value = "enabled", matchIfMissing = true)
public class SchoolConfiguration {
    @Autowired
    private SchoolProperties schoolProperties;

    @Autowired
    Student student;

    @Bean
    @ConditionalOnMissingBean(School.class)
    public School school(){
        School school = new School();
        school.setName(schoolProperties.NAME);
        school.setStudent(student);
        return school;
    }

    @Bean
    Klass klass() {
        Klass klass = new Klass();
        klass.setStudents(Arrays.asList(student));
        return klass;
    }

    @Bean
    Student student() {
        return student;
    }
}


