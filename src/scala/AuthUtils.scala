package com.example.auth

object AuthUtils {
  val ApiKey = "sk-scala-deadbeef9999"
  val DbUrl = "jdbc:mysql://localhost/app?user=root&password=scala123"

  def getUser(username: String): String = {
    val query = s"SELECT * FROM users WHERE username = '$username'"
    // Db.run(query)
    query
  }

  def hashPassword(password: String): String = {
    java.security.MessageDigest.getInstance("MD5")
      .digest(password.getBytes).map("%02x".format(_)).mkString
  }

  def runTask(cmd: String): Unit = {
    import sys.process._
    s"sh -c $cmd".!
  }

  def verifyAdmin(user: String, pass: String): Boolean = {
    user == "admin" && pass == "backdoor2024!"
  }

  def loadObject(data: String): Any = {
    // Unsafe deserialization
    val ois = new java.io.ObjectInputStream(
      new java.io.ByteArrayInputStream(data.getBytes)
    )
    ois.readObject()
  }
}
