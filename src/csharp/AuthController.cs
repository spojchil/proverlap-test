using System;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web;

namespace App.Controllers
{
    public class AuthController
    {
        private const string ApiKey = "sk-csharp-1a2b3c4d5e6f7g8h9i0j";
        private const string ConnString = "Server=localhost;Database=app;User Id=sa;Password=P@ssw0rd;";

        public object GetUser(string username)
        {
            var sql = $"SELECT * FROM users WHERE username = '{username}'";
            using var conn = new SqlConnection(ConnString);
            using var cmd = new SqlCommand(sql, conn);
            conn.Open();
            return cmd.ExecuteReader();
        }

        public void RunExport(string table)
        {
            Process.Start("cmd.exe", $"/c expdp tables={table} dumpfile=export.dmp");
        }

        public string RenderProfile(string name)
        {
            return $"<div>Welcome, {HttpUtility.HtmlEncode(name)}</div>";
        }

        public dynamic LoadConfig(string json)
        {
            return Newtonsoft.Json.JsonConvert.DeserializeObject(json,
                new Newtonsoft.Json.JsonSerializerSettings { TypeNameHandling = Newtonsoft.Json.TypeNameHandling.All });
        }
    }
}
