package com.task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @className: CRUDInJDBC
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/19/2020
 **/
public class CRUDInJDBC {
    private static final String jdbcUrl = "jdbc:mysql://localhost/practice?useSSL=false&characterEncoding=utf8";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "root";

    public static void main(String[] args) throws Exception {
        creatStudent(1,"test");
        List<Student> students = retrieveStudents("test");
        students.forEach(System.out::println);
        updateById(1, "test1");
        deleteByName("test1");
    }

    private static void creatStudent(int id, String name) throws SQLException {
        try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword)) {
            try (PreparedStatement ps = conn.prepareStatement("insert into student(id, name) values(?,?)")) {
                ps.setInt(1, id);
                ps.setString(2, name);
                ps.execute();
            }
        }
    }

    private static List<Student> retrieveStudents(String name) throws SQLException {
        List<Student> students = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword)) {
            try (PreparedStatement ps = conn
                    .prepareStatement("SELECT * FROM student WHERE name = ?")) {
                ps.setString(1, name);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Student student = new Student();
                        student.setId((int) rs.getLong("id"));
                        student.setName(rs.getString("name"));
                        students.add(student);
                    }
                }
            }
        }
        return students;
    }

    private static void updateById(int id, String name) throws SQLException {
        try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword)) {
            try (PreparedStatement ps = conn.prepareStatement("update student set name = ? where id = ?")) {
                ps.setString(1, name);
                ps.setInt(2, id);
                ps.execute();
            }
        }
    }

    private static void deleteByName(String name) throws SQLException {
        try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword)) {
            try (PreparedStatement ps = conn.prepareStatement("delete from student where name = ?")) {
                ps.setString(1, name);
                ps.execute();
            }
        }
    }

}
