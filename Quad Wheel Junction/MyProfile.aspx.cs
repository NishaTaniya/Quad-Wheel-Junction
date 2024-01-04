using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Quad_Wheel_Junction
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        static Boolean validEmail = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["user_type"] != null && Session["user_id"] != null)
                {
                    if (Session["user_type"].Equals("Customer"))
                    {
                        DriverPanel.Visible = false;
                        List<String> result = bc.getCustomerData((Int32)Session["user_id"]);
                        name.Text = result[0];
                        email.Text = result[1];
                        phone.Text = result[2];
                        location.Text = result[3];
                    }

                    else if (Session["user_type"].Equals("Driver"))
                    {
                        DriverPanel.Visible = true;
                        // bc.getDriverData((Int32)Session["user_id"], Basic, BasicDriver, carGrid);
                        List<String> result = bc.getDriverData((Int32)Session["user_id"], carGrid);
                        name.Text = result[0];
                        email.Text = result[1];
                        phone.Text = result[2];
                        location.Text = result[3];
                        expr.Text = result[4];
                        licence.Text = result[5];
                        rating.Text = result[6];

                        if (result[7].ToLower() == "false")
                            stateText.Text = "Not Available";
                        else
                            stateText.Text = "Available";
                    }
                }
                
            }
        }

        protected void emailValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Session["user_type"] != null  && Session["user_id"]!=null)
            {
                args.IsValid = bc.bussIsEmailExist(Session["user_type"].ToString(), args.Value, (Int32)Session["user_id"]);
                validEmail = args.IsValid;
            }
   
        }

        protected void carGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Car Id";
                e.Row.Cells[1].Text = "Car Name";
                e.Row.Cells[2].Text = "Model";
                e.Row.Cells[3].Text = "Seats";
                e.Row.Cells[4].Text = "Rate per KM";
               
            }
        }

        protected void updateProfile_Click(object sender, EventArgs e)
        {
            if (Session["user_type"] != null && Session["user_id"] != null)
            {
                if (Session["user_type"].Equals("Customer"))
                {
                    SetFocus(name);
                    name.Enabled = true;
                    email.Enabled = true;
                    phone.Enabled = true;
                    location.Enabled = true;
                    updateCustomer.Visible = true;
                }

                else if (Session["user_type"].Equals("Driver"))
                {
                    SetFocus(name);
                    name.Enabled = true;
                    email.Enabled = true;
                    phone.Enabled = true;
                    location.Enabled = true;
                    expr.Enabled = true;
                    stateText.Visible = false;

                    if (stateText.Text == "Available")
                        state.Checked = true;
                    else
                        state.Checked = false;

                    state.Visible = true;
                    updateDriver.Visible = true;
                }     
            }
        }

        protected void updateCustomer_Click(object sender, EventArgs e)
        {

            if (validEmail && Session["user_id"] != null)
            {
                //MessageBox.Show(phone.Text + "  " + location.Text);
                bc.bussUpdateCustomerProfile((Int32)Session["user_id"], name.Text, email.Text, phone.Text, location.Text);
                MessageBox.Show("Profile updated successfully...");
                Response.Redirect("MyProfile.aspx");
            }
        }

        protected void updateDriver_Click(object sender, EventArgs e)
        {
            if (validEmail && Session["user_id"] != null)
            {
                bc.bussUpdateDriverProfile((Int32)Session["user_id"], name.Text, email.Text, phone.Text, location.Text, expr.Text, state.Checked);
                MessageBox.Show("Profile updated successfully...");
                Response.Redirect("MyProfile.aspx");
            }
        }

        protected void updateRate_Click(object sender, EventArgs e)
        {
            add.Visible = false;
            delete.Visible = false;
            update.Visible = true;
            SetFocus(update);
        }

        protected void addCar_Click(object sender, EventArgs e)
        {
            delete.Visible = false;
            update.Visible = false;
            add.Visible = true;
            SetFocus(add);
        }

        protected void deleteCar_Click(object sender, EventArgs e)
        {
            update.Visible = false;
            add.Visible = false;
            delete.Visible = true;
            SetFocus(delete);
        }

        protected void finalUpdate_Click(object sender, EventArgs e)
        {
            bc.bussUpdateCarRate(updateId.Text, updateCarRate.Text);
            updateId.Text = "";  updateCarRate.Text = "";
            update.Visible = false;
            Response.Redirect("Myprofile.aspx");
            SetFocus(updateRate);
        }

        protected void finalDelete_Click(object sender, EventArgs e)
        {
            bc.bussDeleteCar(deleteId.Text);
            deleteId.Text = "";
            delete.Visible = false;
            Response.Redirect("Myprofile.aspx#carGrid");
            SetFocus(deleteCar);
        }

        protected void dropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (nameDropdown.SelectedItem.Text == "Maruti Suzuki")
            {
                hyundaiDropdown.Visible = false;
                toyotaDropdown.Visible = false;
                tataDropdown.Visible = false;
                mahindraDropdown.Visible = false;
                suzukiDropdown.Visible = true;
                SetFocus(suzukiDropdown);
            }

            else if (nameDropdown.SelectedItem.Text == "Hyundai")
            {
                suzukiDropdown.Visible = false;
                toyotaDropdown.Visible = false;
                tataDropdown.Visible = false;
                mahindraDropdown.Visible = false;
                hyundaiDropdown.Visible = true;
                SetFocus(hyundaiDropdown);
            }

            else if (nameDropdown.SelectedItem.Text == "Toyota")
            {
                suzukiDropdown.Visible = false;
                hyundaiDropdown.Visible = false;
                tataDropdown.Visible = false;
                mahindraDropdown.Visible = false;
                toyotaDropdown.Visible = true;
                SetFocus(toyotaDropdown);
            }

            else if (nameDropdown.SelectedItem.Text == "Tata")
            {
                suzukiDropdown.Visible = false;
                hyundaiDropdown.Visible = false;
                toyotaDropdown.Visible = false;
                mahindraDropdown.Visible = false;
                tataDropdown.Visible = true;
                SetFocus(tataDropdown);

            }

            else if (nameDropdown.SelectedItem.Text == "Mahindra")
            {
                suzukiDropdown.Visible = false;
                hyundaiDropdown.Visible = false;
                toyotaDropdown.Visible = false;
                tataDropdown.Visible = false;
                mahindraDropdown.Visible = true;
                SetFocus(mahindraDropdown);
            }
        }

        protected void finalAdd_Click(object sender, EventArgs e)
        {
            String model = "";
            if (nameDropdown.SelectedItem.Text == "--SELECT CAR NAME--")
            {
                drpName.IsValid = false;
                return;
            }

            else if (nameDropdown.SelectedItem.Text == "Maruti Suzuki")
            {
                if (suzukiDropdown.SelectedItem.Text == "--SELECT MARUTI MODEL--")
                {
                    drpMaruti.IsValid = false;
                    return;
                }
                else
                {
                    model = suzukiDropdown.SelectedItem.Text;
                }
            }

            else if (nameDropdown.SelectedItem.Text == "Hyundai")
            {
                if (hyundaiDropdown.SelectedItem.Text == "--SELECT HYUNDAI MODEL--")
                {
                    drpHyundai.IsValid = false;
                    return;
                }
                else
                {
                    model = hyundaiDropdown.SelectedItem.Text;
                }
            }

            else if (nameDropdown.SelectedItem.Text == "Toyota")
            {
                if (toyotaDropdown.SelectedItem.Text == "--SELECT TOYOTA MODEL--")
                {
                    drpToyota.IsValid = false;
                    return;
                }
                else
                {
                    model = toyotaDropdown.SelectedItem.Text;
                }
            }

            else if (nameDropdown.SelectedItem.Text == "Tata")
            {
                if (tataDropdown.SelectedItem.Text == "--SELECT TATA MODEL--")
                {
                    drpTata.IsValid = false;
                    return;
                }
                else
                {
                    model = tataDropdown.SelectedItem.Text;
                }
            }

            else if (nameDropdown.SelectedItem.Text == "Mahindra")
            {
                if (hyundaiDropdown.SelectedItem.Text == "--SELECT MAHINDRA MODEL--")
                {
                    drpMahindra.IsValid = false;
                    return;
                }
                else
                {
                    model = mahindraDropdown.SelectedItem.Text;
                }
            }

            if (nameDropdown.SelectedItem.Text != "--SELECT CAR NAME--" && model != "" && Session["user_Id"] != null)
            {
                if(Session["user_Id"]!=null)
                {
                    int driver = (Int32)Session["user_Id"];
                    bc.bussAddCar(nameDropdown.SelectedItem.Text, model, seats.Text, addRate.Text, driver);
                    nameDropdown.SelectedItem.Text = "--SELECT CAR NAME--"; seats.Text = ""; addRate.Text = "";
                    suzukiDropdown.Visible = false; hyundaiDropdown.Visible = false;
                    tataDropdown.Visible = false; toyotaDropdown.Visible = false; mahindraDropdown.Visible = false;
                    add.Visible = false;
                    Response.Redirect("MyProfile.aspx");
                }
                    
            }
        }

        
    }
}