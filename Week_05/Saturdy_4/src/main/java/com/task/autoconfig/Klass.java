package com.task.autoconfig;

import lombok.Data;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Data
public class Klass {
    
    List<Student> students;
    
    public void dong(){
        System.out.println(this.getStudents());
    }
    
}
