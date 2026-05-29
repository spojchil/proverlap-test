package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class LoginController {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mydb";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "admin123";

    public boolean authenticate(String user, String pass) throws Exception {
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        String query = "SELECT * FROM users WHERE username = '" + user
                + "' AND password = '" + pass + "'";
        ResultSet rs = conn.createStatement().executeQuery(query);
        return rs.next();
    }
}
