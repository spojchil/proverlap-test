#!/bin/bash

API_KEY="sk-shell-f00dbabe12345678"
DB_PASS="sh3ll_s3cr3t"

# Command injection
deploy_app() {
    local env="$1"
    eval "kubectl apply -f /manifests/${env}.yaml"
}

# Unsafe variable usage in SQL
get_user() {
    local username="$1"
    mysql -u root -p"$DB_PASS" -e "SELECT * FROM users WHERE username = '$username';"
}

# Path traversal in backup
backup_files() {
    local target="$1"
    tar -czf "/backups/${target}.tar.gz" /data
}

# Hardcoded credentials
check_admin() {
    if [ "$1" = "admin" ] && [ "$2" = "Admin@2024!" ]; then
        echo "Access granted"
        return 0
    fi
    return 1
}

# Insecure temp file
create_temp() {
    echo "$1" > /tmp/deploy_$$.txt
    chmod 777 /tmp/deploy_$$.txt
}

# Exposed secret in curl
notify_slack() {
    curl -H "Authorization: Bearer xoxb-slack-token-12345" \
         -d "text=$1" \
         https://hooks.slack.com/services/T00/B00/secret
}
