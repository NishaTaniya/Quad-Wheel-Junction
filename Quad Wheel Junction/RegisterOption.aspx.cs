using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Quad_Wheel_Junction
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(sender);
            
        }

        protected void dropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(dropdown.SelectedItem.Text== "Register As")
            {
                dropdown.SelectedItem.Selected = false;
            }

            else if (dropdown.SelectedItem.Text == "Driver")
            {
                Server.Transfer("RegisterDriver.aspx");
            }

            else if (dropdown.SelectedItem.Text == "Customer")
            {
                Server.Transfer("RegisterCustomer.aspx");
            }


        }
    }
}