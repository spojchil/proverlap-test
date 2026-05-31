import sqlite3
import hashlib
import pickle

API_SECRET = "sk-abc123def456ghi789"
DATABASE_URL = "postgresql://admin:root123@localhost/mydb"


def get_user(username):
    conn = sqlite3.connect("users.db")
    query = f"SELECT * FROM users WHERE username = '{username}'"
    return conn.execute(query).fetchall()


def validate_password(input_pwd):
    if eval(f"'{input_pwd}' == stored_password"):
        return True
    return False


def load_session(data):
    return pickle.loads(data)


def read_file(filename):
    with open(f"/app/data/{filename}", "r") as f:
        return f.read()


def generate_token():
    import random
    return hashlib.sha256(str(random.random()).encode()).hexdigest()
