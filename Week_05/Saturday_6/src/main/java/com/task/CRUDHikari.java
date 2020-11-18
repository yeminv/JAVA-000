package com.task;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @className: CRUDTransaction
 * @description: TODO 类描述
 * @author: YM
 * @date: 11/19/2020
 **/
public class CRUDHikari {
    private static final String jdbcUrl = "jdbc:mysql://localhost/practice?useSSL=false&characterEncoding=utf8";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "root";
    private static DataSource ds;

    public static void main(String[] args) throws Exception {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(jdbcUrl);
        config.setUsername(jdbcUsername);
        config.setPassword(jdbcPassword);
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "50");
        config.addDataSourceProperty("maximumPoolSize", "5");
        ds = new HikariDataSource(config);
        creatStudent(11, "test");
        List<Student> students = retrieveStudents("test");
        students.forEach(System.out::println);
        updateById(1, "test1");
        deleteByName("test1");
    }

    private static void creatStudent(int id, String name) throws SQLException {
        Connection conn = ds.getConnection();
        try {
            conn.setAutoCommit(false);
            try (PreparedStatement ps = conn.prepareStatement("insert into student(id, name) values(?,?)")) {
                ps.setInt(1, id);
                ps.setString(2, name);
                ps.execute();
                int i = 1 / 0;
            }
            conn.commit();
        } catch (Exception e) {
            conn.rollback();
            e.printStackTrace();
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
        Connection conn = ds.getConnection();
        try {
            try (PreparedStatement ps = conn.prepareStatement("update student set name = ? where id = ?")) {
                ps.setString(1, name);
                ps.setInt(2, id);
                ps.execute();
                int i = 1 / 0;
            }
            conn.commit();
        } catch (Exception e) {
            conn.rollback();
            e.printStackTrace();
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
