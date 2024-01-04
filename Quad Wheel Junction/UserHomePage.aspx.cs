using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Quad_Wheel_Junction
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["location"] != null)
                {
                    string location = Request.QueryString["location"];

                    if (!location.Equals("") && Session["user_id"]!=null && Session["user_type"]!=null)
                        bc.bussChangeLocation((Int32)Session["user_id"], Session["user_type"].ToString(), location); 
                    //MessageBox.Show("Location Is "+location);
                }
            }
            
        }
    }
}