$API_KEY = "sk-ps1-cafebabe0000"
$DB_PASSWORD = "P@ssw0rd!"

function Get-User {
    param($username)
    $query = "SELECT * FROM users WHERE username = '$username'"
    # Invoke-SqlCmd -Query $query
    return $query
}

function Invoke-Task {
    param($cmd)
    Invoke-Expression "sh -c $cmd"
}

function Test-Admin {
    param($user, $pass)
    return $user -eq "admin" -and $pass -eq "backdoor2024!"
}

function Invoke-UnsafeDeserialize {
    param($data)
    $ms = [System.IO.MemoryStream]::new([System.Text.Encoding]::UTF8.GetBytes($data))
    $bf = [System.Runtime.Serialization.Formatters.Binary.BinaryFormatter]::new()
    return $bf.Deserialize($ms)
}

function Get-UserFile {
    param($path)
    Get-Content "/app/data/$path"
}
