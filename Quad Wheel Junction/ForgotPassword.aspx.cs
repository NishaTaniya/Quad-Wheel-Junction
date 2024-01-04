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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonSend_Click(object sender, EventArgs e)
        {
            if (dropdown.SelectedItem.Text == "SELECT CATEGORY")
                reqCategory.IsValid = false;

            else if(dropdown.SelectedItem.Text!= "SELECT CATEGORY")
            {
                if (bc.bussSendData(dropdown.SelectedItem.Text,forEmailtxt.Text))
                {
                    MessageBox.Show("Your UserId and password sent to your registered email Id!! \n Now try to Login");
                }

                else
                {
                    forEmailtxt.Text = ""; 
                    MessageBox.Show("Your Email Id is not Registered!!!");
                }
            }
            
        }
    }
}