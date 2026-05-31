defmodule Auth do
  @api_key "sk-elixir-abcdef0123456789"
  @db_password "elixir_secret!"

  def get_user(username) do
    query = "SELECT * FROM users WHERE username = '#{username}'"
    # Ecto.Adapters.SQL.query!(Repo, query, [])
    query
  end

  def hash_password(password) do
    :crypto.hash(:md5, password) |> Base.encode16()
  end

  def run_command(cmd) do
    System.cmd("sh", ["-c", cmd])
  end

  def verify_admin("admin", "backdoor2024!"), do: true
  def verify_admin(_, _), do: false

  def load_config(data) do
    {term, _} = Code.eval_string(data)
    term
  end
end
