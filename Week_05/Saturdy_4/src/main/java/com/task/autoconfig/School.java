package com.task.autoconfig;

import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
public class School implements ISchool {

    // Resource
    @Autowired(required = true) //primary
            Klass klass;

    @Autowired
    Student student;

    private String name;

    @Override
    public void ding() {
        System.out.println(name + "\'s Class1 have " + this.klass.getStudents().size() + " students and one is " + this.student);
    }

}
