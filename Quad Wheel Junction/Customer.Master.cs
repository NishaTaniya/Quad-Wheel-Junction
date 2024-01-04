using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class Customer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user_name"] == null || Session["user_id"]==null || Session["user_type"]==null)
            {
                Response.Redirect("Login.aspx");
            }


            if (Session["user_name"] != null)
                txtuser.Text = Session["user_name"].ToString();

            if (Session["user_type"] != null)
            {
                if (Session["user_type"].Equals("Driver"))
                {
                    CustomerLink.Visible = false;
                    ReviewLink.Visible = false;
                }
                    
            }

        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session["user_id"] = null;
            Session["user_type"] = null;
            Session["user_name"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}