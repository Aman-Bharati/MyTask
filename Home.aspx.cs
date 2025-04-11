using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyTask
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                litUsername.Text = Session["Username"].ToString();
                LoggedInContent.Visible = true;
                LoggedOutContent.Visible = false;
            }
            else
            {
                LoggedInContent.Visible = false;
                LoggedOutContent.Visible = true;
            }
        }
    }
}