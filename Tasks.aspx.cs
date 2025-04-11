using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MyTask
{
    public partial class Tasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindTaskGrid("All"); 
            }
        }

        private void BindTaskGrid(string status)
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Amar\source\repos\MyTask\MyTask\App_Data\Database1.mdf;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query;

                if (status == "All")
                {
                    query = "SELECT ID, Title, Description, Status, DueTime FROM Tasks WHERE UserId = @UserId";
                }
                else
                {
                    query = "SELECT ID, Title, Description, Status, DueTime FROM Tasks WHERE UserId = @UserId AND Status = @Status";
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    if (status != "All")
                    {
                        cmd.Parameters.AddWithValue("@Status", status);
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvTasks.DataSource = dt;
                    gvTasks.DataBind();
                }
            }
        }

        protected void ddlTaskStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedStatus = ddlTaskStatus.SelectedValue;
            BindTaskGrid(selectedStatus); 
        }
    }
}
