package com.task.thursday.no2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @className: InAnnotation
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/16/2020
 **/
public class InAnnotation {

    public static void main(String[] args) {
        ApplicationContext ac = new AnnotationConfigApplicationContext(SpringConfiguration.class);
        Student student = (Student) ac.getBean("student");
        System.out.println(student.create());
    }
}
