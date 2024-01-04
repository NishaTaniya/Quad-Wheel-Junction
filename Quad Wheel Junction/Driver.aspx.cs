using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{ 
    public partial class WebForm10 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            bc.getDriverDetail(DriverGridView);
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Driver Id";
                e.Row.Cells[1].Text = "User Name";
                e.Row.Cells[2].Text = "Name";
                e.Row.Cells[3].Text = "Email Id";
                e.Row.Cells[4].Text = "Phone No";
                e.Row.Cells[5].Text = "Location";
                e.Row.Cells[6].Text = "Experience";
                e.Row.Cells[7].Text = "Licence No";
                e.Row.Cells[8].Text = "Status";
                e.Row.Cells[9].Text = "Action";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkDelete = new LinkButton();
                lnkDelete.ID = "lnkDelete";
                lnkDelete.Text = "Delete";
                lnkDelete.Click += deleteDetails;

                e.Row.Cells[9].Controls.Add(lnkDelete);
            }
                
        }

        protected void deleteDetails(object sender, EventArgs e)
        {
            LinkButton lnkDelete = (sender as LinkButton);
            GridViewRow row = (lnkDelete.NamingContainer as GridViewRow);
            string id = row.Cells[0].Text.ToString();
            //string country = (row.FindControl("txtCountry") as TextBox).Text;
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Id: " + id + " Name: " + name + " Country: " + country + "')", true);
            bc.bussdeleteRecord(Int32.Parse(id));
            Response.Redirect("Driver.aspx");
        }

    }
}