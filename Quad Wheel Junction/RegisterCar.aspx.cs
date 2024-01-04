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
    public partial class WebForm4 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            String model = "";
            if(nameDropdown.SelectedItem.Text=="--SELECT CAR NAME--")
            {
                drpName.IsValid = false;
                return;
            }

            else if(nameDropdown.SelectedItem.Text== "Maruti Suzuki")
            {
                if(suzukiDropdown.SelectedItem.Text== "--SELECT MARUTI MODEL--")
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

            if (nameDropdown.SelectedItem.Text != "--SELECT CAR NAME--" && model!="" && Session["Driver_Id"]!=null)
            {
               int driver = (Int32)Session["Driver_Id"];
               bc.bussAddCar(nameDropdown.SelectedItem.Text, model, txtseats.Text, txtrates.Text, driver);
                nameDropdown.SelectedItem.Text = "--SELECT CAR NAME--";  txtseats.Text = ""; txtrates.Text = "";
                suzukiDropdown.Visible = false; hyundaiDropdown.Visible = false;
                tataDropdown.Visible = false;  toyotaDropdown.Visible = false; mahindraDropdown.Visible = false;
                SuccessPanel.Visible = true;
            }
            
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
            }

            else if (nameDropdown.SelectedItem.Text == "Hyundai")
            {
               suzukiDropdown.Visible = false;
               toyotaDropdown.Visible = false;
               tataDropdown.Visible = false;
               mahindraDropdown.Visible = false;
               hyundaiDropdown.Visible = true;
            }

            else if (nameDropdown.SelectedItem.Text == "Toyota")
            {
                suzukiDropdown.Visible = false;
                hyundaiDropdown.Visible = false;
                tataDropdown.Visible = false;
                mahindraDropdown.Visible = false;
                toyotaDropdown.Visible = true;
            }

            else if (nameDropdown.SelectedItem.Text == "Tata")
            {
                suzukiDropdown.Visible = false;
                hyundaiDropdown.Visible = false;
                toyotaDropdown.Visible = false;
                mahindraDropdown.Visible = false;
                tataDropdown.Visible = true;

            }

            else if (nameDropdown.SelectedItem.Text == "Mahindra")
            {
                suzukiDropdown.Visible = false;
                hyundaiDropdown.Visible = false;
                toyotaDropdown.Visible = false;
                tataDropdown.Visible = false;
                mahindraDropdown.Visible = true;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            nameDropdown.SelectedItem.Text = "--SELECT CAR NAME--"; txtseats.Text = ""; txtrates.Text = "";
            suzukiDropdown.Visible = false; hyundaiDropdown.Visible = false;
            toyotaDropdown.Visible = false;
            tataDropdown.Visible = false;
            mahindraDropdown.Visible = false;
        }

        protected void cross_Click(object sender, EventArgs e)
        {
            SuccessPanel.Visible = false;
        }
    }
}