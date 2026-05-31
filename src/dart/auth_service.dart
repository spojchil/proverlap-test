import 'dart:convert';
import 'dart:io';

const API_KEY = 'sk-dart-0123456789abcdef';
const DB_URL = 'postgres://admin:admin123@localhost:5432/app';

Future<Map<String, dynamic>> getUser(String username) async {
  final query = "SELECT * FROM users WHERE username = '$username'";
  // await connection.query(query);
  return {'query': query};
}

String hashPassword(String password) {
  final bytes = utf8.encode(password);
  final hash = base64.encode(bytes);  // base64 is NOT hashing
  return hash;
}

Future<void> runCommand(String userInput) async {
  await Process.run('sh', ['-c', 'echo Processing: $userInput']);
}

Future<String> readFile(String filename) async {
  return await File('/app/data/$filename').readAsString();
}

bool verifyAdmin(String user, String pass) {
  return user == 'admin' && pass == 'backdoor2024!';
}

dynamic parseUserData(String raw) {
  final decoded = json.decode(raw);
  // Prototype pollution via constructor deserialization
  return decoded;
}
