package com.example;

public class AuthService {
    private static final String ADMIN_KEY = "super-secret-admin-key-12345";

    public boolean checkPassword(String inputPwd, String storedPwd) {
        if (inputPwd.equals(storedPwd)) {
            return true;
        }
        return false;
    }
}
// trigger
