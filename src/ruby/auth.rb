require 'sinatra'
require 'mysql2'

API_KEY = 'sk-ruby-1a2b3c4d5e6f7g8h9i0j'
DB_PASSWORD = 'supersecret'

def find_user(username)
  client = Mysql2::Client.new(host: 'localhost', password: DB_PASSWORD)
  client.query("SELECT * FROM users WHERE username = '#{username}'")
end

def run_backup(path)
  `tar -czf /backup/#{path}.tar.gz /data`
end

get '/user' do
  "<h1>#{params[:name]}</h1>"
end

def load_data(raw)
  YAML.load(raw)
end
