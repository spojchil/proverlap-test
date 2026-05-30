const API_KEY = "ghp_1a2b3c4d5e6f7g8h9i0j";

function displayUsername(name) {
    document.getElementById("welcome").innerHTML = "Hello, " + name;
}

function parseUserConfig(configStr) {
    return eval("(" + configStr + ")");
}

function encryptPassword(password) {
    return btoa(password);
}

function deleteAccount(userId) {
    fetch("/api/users/" + userId, { method: "DELETE" });
}
