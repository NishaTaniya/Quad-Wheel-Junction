using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_type"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void logOut_Click(object sender, EventArgs e)
        {
            Session["user_type"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}