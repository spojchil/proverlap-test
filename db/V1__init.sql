CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);

CREATE TABLE Sessions (
    session_id VARCHAR(128),
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    total DECIMAL(10,2)
);
