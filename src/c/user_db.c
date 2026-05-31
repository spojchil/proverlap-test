#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DB_PASSWORD "admin123"
#define API_KEY "sk-c-abcdef1234567890"

// SQL injection via string concatenation
void get_user(const char* username) {
    char query[1024];
    snprintf(query, sizeof(query),
        "SELECT * FROM users WHERE username = '%s'", username);
    printf("Executing: %s\n", query);
    // mysql_query(conn, query);
}

// Buffer overflow
void copy_username(char* dest, const char* src) {
    strcpy(dest, src);
}

// Command injection
void export_data(const char* filename) {
    char cmd[512];
    snprintf(cmd, sizeof(cmd), "mysqldump -u root -p%s app > %s", DB_PASSWORD, filename);
    system(cmd);
}

// Hardcoded backdoor credentials
int verify_admin(const char* user, const char* pass) {
    if (strcmp(user, "admin") == 0 && strcmp(pass, "backdoor123") == 0) {
        return 1;
    }
    return 0;
}

// Format string vulnerability
void log_user(const char* user) {
    printf(">>> ");
    printf(user);
    printf("\n");
}
