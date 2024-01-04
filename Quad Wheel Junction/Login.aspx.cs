using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string message = "alert('Hello! Mudassar.')";
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
            if (dropdown.SelectedItem.Text == "Login As")
            {
                reqCategory.IsValid = false;
            }

            else if(dropdown.SelectedItem.Text=="Admin")
            {
                if(bc.bussAuthenticate(txtusername.Text,txtpassword.Text,"Admin"))
                {
                    Session["user_type"] = "Admin";
                    Response.Redirect("Dashboardadmin.aspx");
                } 
                
                else
                {
                    DangerPanel.Visible = true;
                }
            }

            else if (dropdown.SelectedItem.Text=="Driver")
            {
                if (bc.bussAuthenticate(txtusername.Text, txtpassword.Text, "Driver"))
                {
                    Session["user_type"] = "Driver";
                    Session["user_id"] = bc.bussGetUserId("Driver", txtusername.Text);
                    Session["user_name"] = txtusername.Text;
                    Response.Redirect("location.aspx");
                } 
                
                else
                {
                    DangerPanel.Visible = true;
                }
            }

            else if (dropdown.SelectedItem.Text=="Customer")
            {
                if (bc.bussAuthenticate(txtusername.Text, txtpassword.Text, "Customer"))
                {
                    Session["user_type"] = "Customer";
                    Session["user_id"] = bc.bussGetUserId("Customer", txtusername.Text);
                    Session["user_name"] = txtusername.Text;
                    Response.Redirect("location.aspx");
                }

                else
                {
                    //string message = "alert('Hello! Nisha.')";
                    //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", message, true);
                   //ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowStatus", "javascript:alert('Record is not updated');", true);
                    DangerPanel.Visible = true;
                    txtpassword.Text = "";
                   
                }
            }
        }

        protected void cross_Click(object sender, EventArgs e)
        {
            DangerPanel.Visible = false;
        }
    }
}