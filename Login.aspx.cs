using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace MyTask
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLoginMessage.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Amar\source\repos\MyTask\MyTask\App_Data\Database1.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT UserId FROM Users WHERE Username = @Username AND Password = @Password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", txtLoginUsername.Text.Trim());
                    command.Parameters.AddWithValue("@Password", txtLoginPassword.Text.Trim());

                    connection.Open();
                    object userId = command.ExecuteScalar();

                    if (userId != null)
                    {
                        Session["UserId"] = Convert.ToInt32(userId);
                        Session["Username"] = txtLoginUsername.Text.Trim();
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        lblLoginMessage.Text = "Invalid username or password.";
                        lblLoginMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
