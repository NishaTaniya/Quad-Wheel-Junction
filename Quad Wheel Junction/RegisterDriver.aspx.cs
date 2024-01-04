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
    public partial class WebForm1 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        static Boolean validUser = false,validEmail=false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            if (validEmail && validUser)
            {
                int driverId=bc.bussRegisterDriver(txtusername.Text, txtname.Text, txtemail.Text, txtphone.Text, txtlocation.Text, txtexperience.Text,txtLicenseno.Text,txtpassword.Text);
                txtusername.Text = "";
                txtname.Text = "";
                txtemail.Text = "";
                txtphone.Text = "";
                txtlocation.Text = "";
                txtexperience.Text = "";
                txtLicenseno.Text = "";
                txtpassword.Text = "";
                txtconfirm.Text = "";
                MessageBox.Show("Your Account is created successfully :) \n Please add Car details...");
                Session["Driver_Id"] = driverId;
           
            Response.Redirect("RegisterCar.aspx");
            }
        }

        protected void emailValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
             args.IsValid = bc.bussValidate("Email", "Driver", args.Value);
             validEmail = args.IsValid;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtusername.Text = "";
            txtname.Text = "";
            txtemail.Text = "";
            txtphone.Text = "";
            txtlocation.Text = "";
            txtexperience.Text = "";
            txtLicenseno.Text = "";
            txtpassword.Text = "";
            txtconfirm.Text = "";
        }

        protected void usernameValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = bc.bussValidate("Username", "Driver", args.Value);
            validUser = args.IsValid;
        }
    }
}