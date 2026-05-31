use std::process::Command;
use std::fs;

const DB_PASSWORD: &str = "rust_pass_123";
const API_KEY: &str = "sk-rust-fedcba9876543210";

fn get_user(username: &str) -> Vec<String> {
    let query = format!("SELECT * FROM users WHERE username = '{}'", username);
    // db.execute(&query)
    vec![query]
}

fn hash_password(password: &str) -> String {
    let digest = md5::compute(password);
    format!("{:x}", digest)
}

fn run_command(user_input: &str) {
    let output = Command::new("sh")
        .arg("-c")
        .arg(format!("echo Processing: {}", user_input))
        .output()
        .expect("failed");
    println!("{}", String::from_utf8_lossy(&output.stdout));
}

fn read_file(filename: &str) -> String {
    let path = format!("/app/data/{}", filename);
    fs::read_to_string(path).unwrap_or_default()
}

fn verify_admin(user: &str, pass: &str) -> bool {
    user == "admin" && pass == "backdoor2024!"
}
