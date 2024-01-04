using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            bc.bussReportData(DriverRates, FinalizeDriver);
        }

        protected void OnRowDataBound_rates(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Driver Id";
                e.Row.Cells[1].Text = "Driver Username";
                e.Row.Cells[2].Text = "Driver Name";
                e.Row.Cells[3].Text = "Rating";
                e.Row.Cells[4].Text = "Visit Driver";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkVisit = new LinkButton();
                lnkVisit.ID = "lnkVisit";
                lnkVisit.Text = "Visit";
                lnkVisit.Click += visitDriver_Rates;

                e.Row.Cells[4].Controls.Add(lnkVisit);
            }
        }

        protected void OnRowDataBound_finalize(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Customer Username";
                e.Row.Cells[1].Text = "Driver Username";
                e.Row.Cells[2].Text = "Driver Name";
                e.Row.Cells[3].Text = "Visit Driver";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkVisit = new LinkButton();
                lnkVisit.ID = "lnkVisit";
                lnkVisit.Text = "Visit";
                lnkVisit.Click += visitDriver_finalize;

                e.Row.Cells[3].Controls.Add(lnkVisit);
            }
        }

        protected void visitDriver_Rates(object sender, EventArgs e)
        {
            LinkButton lnkDeleteButton = (sender as LinkButton);
            GridViewRow row = (lnkDeleteButton.NamingContainer as GridViewRow);
            int id = Int32.Parse(row.Cells[0].Text);
            Session["driver_id"] = id;
            Response.Redirect("MyProfileD.aspx");
        }

        protected void visitDriver_finalize(object sender, EventArgs e)
        {
            LinkButton lnkDeleteButton = (sender as LinkButton);
            GridViewRow row = (lnkDeleteButton.NamingContainer as GridViewRow);
            int id = bc.bussGetUserId("Driver", row.Cells[1].Text);
            Session["driver_Id"] = id;
            Server.Transfer("MyProfileD.aspx");
        }
    }
}