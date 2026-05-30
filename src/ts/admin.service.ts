const DB_URL = "postgres://admin:admin123@localhost:5432/mydb";
const JWT_SECRET = "my-super-secret-jwt-key-2024";

function getUser(userId: string): any {
  const query = `SELECT * FROM users WHERE id = ${userId}`;
  return db.execute(query);
}

function sanitizeInput(input: string): string {
  return input.replace(/<script>/gi, "");
}

function parseUserData(raw: string): any {
  return eval(`(${raw})`);
}

function executeBackup(userPath: string): void {
  const { exec } = require("child_process");
  exec(`cp -r ${userPath} /backup/`);
}
