using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Button = System.Web.UI.WebControls.Button;
using Label = System.Web.UI.WebControls.Label;

namespace Quad_Wheel_Junction
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_type"]!=null && Session["user_type"].Equals("Driver"))
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void mainDrop_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(mainDrop.SelectedItem.Text == "--SELECT FILTER CATEGORY--")
            {
                reqCategory.IsValid = false;
            }

            else if(mainDrop.SelectedItem.Text=="Location")
            {
                txtrate.Visible = false; txtdriver.Visible = false; nameDropdown.Visible = false; txtlocation.Visible = true;
                btnSearch.Visible = true;
                filterData.DataSource=null;
                filterData.DataBind();
            }

            else if (mainDrop.SelectedItem.Text == "Rate per KM")
            {
                 txtdriver.Visible = false; nameDropdown.Visible = false; txtlocation.Visible = false; txtrate.Visible = true;
                btnSearch.Visible = true;
                filterData.DataSource = null;
                filterData.DataBind();
            }

            else if (mainDrop.SelectedItem.Text == "Car Name")
            {
                txtlocation.Visible = false;  txtrate.Visible = false; txtdriver.Visible = false; nameDropdown.Visible = true;
                btnSearch.Visible = true;
                filterData.DataSource = null;
                filterData.DataBind();
            }

            else if (mainDrop.SelectedItem.Text == "Driver Name")
            {
                txtlocation.Visible = false;  txtrate.Visible = false; nameDropdown.Visible = false;  txtdriver.Visible = true;
                btnSearch.Visible = true;
                filterData.DataSource = null;
                filterData.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (mainDrop.SelectedItem.Text == "Location")
                bc.bussFilter("Location", txtlocation.Text, filterData);
            else if(mainDrop.SelectedItem.Text == "Rate per KM")
                bc.bussFilter("Rate", txtrate.Text, filterData);
            else if (mainDrop.SelectedItem.Text == "Car Name")
                bc.bussFilter("Car", nameDropdown.SelectedItem.Text, filterData);
            else if (mainDrop.SelectedItem.Text == "Driver Name")
                bc.bussFilter("Driver", txtdriver.Text, filterData);

            if (filterData.Items.Count == 0)
            {
                MessageBox.Show("No such Driver found...");
            }
        }

        protected void username_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id=bc.bussGetUserId("Driver", button.Text);
            Session["driver_Id"] = id;
            Server.Transfer("MyProfileD.aspx");
        }

        protected void Item_Bound(Object sender, DataListItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label status = (Label)e.Item.FindControl("status");
                //MessageBox.Show(status.Text);

                if (status.Text.Equals("False"))
                {
                    status.Text = "Not Available";
                    status.ForeColor = Color.Red;
                }

                else if(status.Text.Equals("True"))
                {
                    status.Text = "Available";
                }
            }

        }

        }
    }