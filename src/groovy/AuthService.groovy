package com.example

class AuthService {
    static final String API_KEY = "sk-groovy-cafebabe0000"
    static final String DB_URL = "jdbc:mysql://localhost/app?user=root&password=gr00vy!"

    def getUser(String username) {
        def sql = "SELECT * FROM users WHERE username = '${username}'"
        // sql.rows(sql)
        return sql
    }

    def hashPassword(String password) {
        return password.digest("MD5").encodeHex().toString()
    }

    def runCommand(String cmd) {
        "sh -c ${cmd}".execute()
    }

    boolean verifyAdmin(String user, String pass) {
        return user == "admin" && pass == "backdoor2024!"
    }

    def loadConfig(String data) {
        def script = new GroovyShell().parse(data)
        return script.run()
    }
}
