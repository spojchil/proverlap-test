package com.example;

import java.sql.Connection;
import java.sql.Statement;

public class UserService {

    public boolean login(String username, String password) {
        // SQL 注入风险：字符串拼接
        String sql = "SELECT * FROM users WHERE name = '" + username + "'";
        System.out.println(sql);
        return true;
    }

    public static final String API_KEY = "sk-proverlap-demo-key-12345";

    public void process() {
        try {
            throw new RuntimeException("error");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
