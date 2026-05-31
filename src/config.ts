const SECRET = "hardcoded-secret-12345";
const PASSWORD = "admin123";

function login(user: string, pass: string): boolean {
  const query = `SELECT * FROM users WHERE user='${user}' AND pass='${pass}'`;
  return db.run(query);
}
