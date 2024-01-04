using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class MyProfileD : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["driver_id"]!=null)
            {
                bc.bussShowDriverProfile((Int32)(Session["driver_id"]), DriverData,carGrid);
            }

        }

        protected void carGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Car Name";
                e.Row.Cells[1].Text = "Model";
                e.Row.Cells[2].Text = "Seats";
                e.Row.Cells[3].Text = "Rate per KM";
            }
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
                }

                else if (status.Text.Equals("True"))
                {
                    status.Text = "Available";
                }
            }

        }

    }
}