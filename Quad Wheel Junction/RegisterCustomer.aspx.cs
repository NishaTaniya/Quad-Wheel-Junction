using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            if(emailValidator.IsValid && usernameValidator.IsValid)
            {
                bc.bussRegisterCustomer(txtusername.Text, txtname.Text, txtemail.Text, txtphone.Text, txtlocation.Text, txtpassword.Text);
                txtusername.Text = "";
                txtname.Text = "";
                txtemail.Text = "";
                txtphone.Text = "";
                txtlocation.Text = "";
                txtpassword.Text = "";
                txtconfirm.Text = "";
                SuccessPanel.Visible = true;
            }
        }

        protected void emailValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = bc.bussValidate("Email", "Customer", args.Value);
        }

        protected void usernameValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = bc.bussValidate("Username", "Customer", args.Value);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtusername.Text = "";
            txtname.Text = "";
            txtemail.Text = "";
            txtphone.Text = "";
            txtlocation.Text = "";
            txtpassword.Text = "";
            txtconfirm.Text = "";
        }

        protected void cross_Click(object sender, EventArgs e)
        {
            SuccessPanel.Visible = false;
        }
    }
}