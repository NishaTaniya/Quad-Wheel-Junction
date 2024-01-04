using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class location : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OK_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHomePage.aspx?location=" + txtlocation.Text);
        }

        
    }
}