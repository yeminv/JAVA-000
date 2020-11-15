package com.task.thursday.no2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @className: InXml
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/15/2020
 **/
public class InXml {
    public static void main(String[] args) {
        ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
        Student student = (Student)ac.getBean("student");
        student.init();
        System.out.println(student.create().toString());
    }
}
