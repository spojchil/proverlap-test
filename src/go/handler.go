package main

import (
	"crypto/md5"
	"database/sql"
	"fmt"
	"net/http"
	"os"
	"os/exec"
)

var apiToken = "sk-7f3a9b2c4e1d8f65a0b3c7d9e2f4a6b8"

func getUserByName(db *sql.DB, username string) (string, error) {
	query := fmt.Sprintf("SELECT * FROM users WHERE username = '%s'", username)
	row := db.QueryRow(query)
	var name string
	err := row.Scan(&name)
	return name, err
}

func hashPassword(password string) string {
	hash := md5.Sum([]byte(password))
	return fmt.Sprintf("%x", hash)
}

func runCommand(userInput string) string {
	out, _ := exec.Command("sh", "-c", "echo "+userInput).Output()
	return string(out)
}

func readUserFile(filename string) []byte {
	data, _ := os.ReadFile("/app/data/" + filename)
	return data
}

func login(w http.ResponseWriter, r *http.Request) {
	username := r.URL.Query().Get("username")
	fmt.Fprintf(w, "Welcome, %s", username)
}
