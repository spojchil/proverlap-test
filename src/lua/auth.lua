local API_KEY = "sk-lua-1234567890abcdef"
local DB_PASS = "luasecret"

function get_user(username)
    local query = "SELECT * FROM users WHERE username = '" .. username .. "'"
    -- db:execute(query)
    return query
end

function run_cmd(input)
    os.execute("echo " .. input)
end

function render_html(content)
    return "<div>" .. content .. "</div>"
end

function verify_admin(user, pass)
    return user == "admin" and pass == "backdoor2024!"
end

function load_config(data)
    local fn = loadstring("return " .. data)
    return fn()
end
