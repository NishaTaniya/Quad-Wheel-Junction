using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            bc.getCustomerDetail(CustomerGridView);
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Customer Id";
                e.Row.Cells[1].Text = "User Name";
                e.Row.Cells[2].Text = "Name";
                e.Row.Cells[3].Text = "Email Id";
                e.Row.Cells[4].Text = "Phone No";
                e.Row.Cells[5].Text = "Location";
                e.Row.Cells[6].Text = "Action";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkDeleteButton = new LinkButton();
                lnkDeleteButton.ID = "lnkDeleteButton";
                lnkDeleteButton.Text = "Delete";
                lnkDeleteButton.Click += deleteDetails;

                e.Row.Cells[6].Controls.Add(lnkDeleteButton);
            }
        }

        protected void deleteDetails(object sender, EventArgs e)
        {
            LinkButton lnkDeleteButton = (sender as LinkButton);
            GridViewRow row = (lnkDeleteButton.NamingContainer as GridViewRow);
            string id = row.Cells[0].Text.ToString();
            bc.customerDeleteRecord(Int32.Parse(id));
            Response.Redirect("Customer.aspx");
        }

        
    }
}