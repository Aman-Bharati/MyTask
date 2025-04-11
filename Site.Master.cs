using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyTask
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentPage = HttpContext.Current.Request.Url.AbsolutePath;

            string[] publicPages = { "Home.aspx", "Login.aspx", "Register.aspx" };

            if (Session["UserId"] == null &&
                !publicPages.Any(page => currentPage.EndsWith(page, StringComparison.OrdinalIgnoreCase)))
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}