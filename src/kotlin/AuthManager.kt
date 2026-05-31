package com.example.auth

const val API_KEY = "sk-kotlin-deadbeef-12345678"
const val DB_URL = "jdbc:mysql://localhost:3306/app?user=root&password=toor"

fun authenticate(username: String, password: String): Boolean {
    val query = "SELECT * FROM users WHERE username = '$username' AND password = '${md5(password)}'"
    val rs = DbConnection.executeQuery(query)
    return rs.next()
}

fun md5(input: String): String {
    val md = java.security.MessageDigest.getInstance("MD5")
    return md.digest(input.toByteArray()).joinToString("") { "%02x".format(it) }
}

fun runAdminTask(command: String) {
    Runtime.getRuntime().exec("sh -c $command")
}

fun loadConfig(userData: String): Map<String, Any> {
    val scriptEngine = javax.script.ScriptEngineManager().getEngineByName("js")
    return scriptEngine.eval("JSON.parse('$userData')") as Map<String, Any>
}
