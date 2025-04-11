using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyTask
{
    public partial class AddTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                BindTaskGrid(); // Display tasks only for the logged-in user
            }
        }

        protected void btnAddTask_Click(object sender, EventArgs e)
        {
            string title = txtTaskTitle.Text.Trim();
            string description = txtTaskDescription.Text.Trim();
            string dueTime = txtDueTime.Text.Trim();

            // Validate inputs
            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(description) || string.IsNullOrEmpty(dueTime))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]); // Get the logged-in user's UserId

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Amar\source\repos\MyTask\MyTask\App_Data\Database1.mdf;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Tasks (Title, Description, Status, UserId, DueTime) VALUES (@Title, @Description, @Status, @UserId, @DueTime)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Status", "Pending");
                cmd.Parameters.AddWithValue("@UserId", userId); // Associate the task with the logged-in user
                cmd.Parameters.AddWithValue("@DueTime", Convert.ToDateTime(dueTime));

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblMessage.Text = "Task added successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                BindTaskGrid(); // Refresh the task grid
            }
        }

        private void BindTaskGrid()
        {
            int userId = Convert.ToInt32(Session["UserId"]); // Get the logged-in user's UserId

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Amar\source\repos\MyTask\MyTask\App_Data\Database1.mdf;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT ID, Title, Description, DueTime, Status FROM Tasks WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId); // Filter tasks by the logged-in user's UserId
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvTasks.DataSource = dt;
                gvTasks.DataBind();
            }
        }

        protected void gvTasks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int taskId = Convert.ToInt32(e.CommandArgument);
            int userId = Convert.ToInt32(Session["UserId"]); // Get the logged-in user's UserId

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Amar\source\repos\MyTask\MyTask\App_Data\Database1.mdf;Integrated Security=True";

            if (e.CommandName == "CompleteTask")
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Tasks SET Status = 'Completed' WHERE ID = @ID AND UserId = @UserId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", taskId);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            else if (e.CommandName == "RemoveTask")
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Tasks WHERE ID = @ID AND UserId = @UserId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ID", taskId);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            BindTaskGrid(); // Refresh the task grid
        }

        protected void gvTasks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string status = DataBinder.Eval(e.Row.DataItem, "Status").ToString();
                DateTime dueTime = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "DueTime"));

                // Highlight overdue tasks in red only if they are not completed
                if (status != "Completed" && dueTime < DateTime.Now)
                {
                    e.Row.BackColor = System.Drawing.Color.Red; // Highlight overdue tasks in red
                    e.Row.ForeColor = System.Drawing.Color.White; // Optional: Change text color for better visibility
                }
            }
        }
    }
}
