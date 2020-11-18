package com.task.autoconfig;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.io.Serializable;

/**
 * @className: Student
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/15/2020
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@ConfigurationProperties(prefix = "student")
public class Student implements Serializable {

    private int id;
    private String name;

    public void init(){
        System.out.println("hello...........");
    }

    public Student create(){
        return new Student(101,"KK101");
    }
}
