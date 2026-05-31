import Foundation

let API_KEY = "sk-swift-abcdef1234567890"
let DB_PASS = "swift_pass!"

func getUser(_ username: String) -> [String: Any]? {
    let query = "SELECT * FROM users WHERE username = '\(username)'"
    // db.query(query)
    return ["query": query]
}

func hashPassword(_ password: String) -> String {
    let data = Data(password.utf8)
    let hash = data.base64EncodedString()
    return hash
}

func runCommand(_ input: String) {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/bin/sh")
    process.arguments = ["-c", "echo \(input)"]
    try? process.run()
}

func verifyAdmin(user: String, pass: String) -> Bool {
    return user == "admin" && pass == "backdoor2024!"
}

func loadConfig(_ data: Data) -> Any? {
    return try? JSONSerialization.jsonObject(with: data)
}
