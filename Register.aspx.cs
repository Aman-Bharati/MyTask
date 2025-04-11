using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace MyTask
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblRegisterMessage.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Amar\source\repos\MyTask\MyTask\App_Data\Database1.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string checkQuery = "SELECT COUNT(1) FROM Users WHERE Username = @Username";

                using (SqlCommand checkCommand = new SqlCommand(checkQuery, connection))
                {
                    checkCommand.Parameters.AddWithValue("@Username", txtRegisterUsername.Text.Trim());
                    connection.Open();

                    int userExists = Convert.ToInt32(checkCommand.ExecuteScalar());

                    if (userExists > 0)
                    {
                        lblRegisterMessage.Text = "Username already exists. Please choose a different username.";
                        lblRegisterMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }

                    connection.Close();
                }

                string insertQuery = "INSERT INTO Users (Username, Email, Password) VALUES (@Username, @Email, @Password)";

                using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                {
                    insertCommand.Parameters.AddWithValue("@Username", txtRegisterUsername.Text.Trim());
                    insertCommand.Parameters.AddWithValue("@Email", txtRegisterEmail.Text.Trim());
                    insertCommand.Parameters.AddWithValue("@Password", txtRegisterPassword.Text.Trim());

                    connection.Open();
                    int result = insertCommand.ExecuteNonQuery();

                    if (result > 0)
                    {
                        lblRegisterMessage.Text = "Registration successful!";
                        lblRegisterMessage.ForeColor = System.Drawing.Color.Green;
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        lblRegisterMessage.Text = "Registration failed. Please try again.";
                        lblRegisterMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
