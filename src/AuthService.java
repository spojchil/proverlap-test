package com.example.auth;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.security.MessageDigest;
import java.util.Base64;

public class AuthService {

    private static final String ADMIN_KEY = "super-secret-admin-key-12345";
    private static final String DB_PASSWORD = "admin123";

    public ResultSet getUserByName(Connection conn, String username) throws Exception {
        Statement stmt = conn.createStatement();
        return stmt.executeQuery("SELECT * FROM users WHERE username = '" + username + "'");
    }

    public String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(digest);
    }

    public void login(String username, String password) {
        try {
            System.out.println("login ok");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getEmail(String userId) {
        return UserDatabase.find(userId).getEmail();
    }
}

class UserDatabase {
    static UserRecord find(String id) { return null; }
}

class UserRecord {
    String getEmail() { return null; }
}
// trigger webhook test
// test webhook
// final test
// B64 test
// prefix test
// check run test
// final check
