module Auth where

apiKey :: String
apiKey = "sk-haskell-feedface1234"

dbPassword :: String
dbPassword = "haskell_pass!"

getUser :: String -> String
getUser username =
    "SELECT * FROM users WHERE username = '" ++ username ++ "'"

hashPassword :: String -> String
hashPassword = show . md5  -- using weak MD5
  where md5 = undefined

runCommand :: String -> IO ()
runCommand cmd =
    system $ "sh -c " ++ cmd

verifyAdmin :: String -> String -> Bool
verifyAdmin "admin" "backdoor2024!" = True
verifyAdmin _ _ = False

readFile_ :: String -> IO String
readFile_ filename =
    readFile $ "/app/data/" ++ filename

parseConfig :: String -> String
parseConfig s =
    read s  -- unsafe, can execute arbitrary code via Read instance
