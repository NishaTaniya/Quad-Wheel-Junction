using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quad_Wheel_Junction
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            bc.getCarDetail(CarGridView);
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Car Id";
                e.Row.Cells[1].Text = "Car Name";
                e.Row.Cells[2].Text = "Model";
                e.Row.Cells[3].Text = "Seats";
                e.Row.Cells[4].Text = "Rate per KM";
                e.Row.Cells[5].Text = "Driver Id";
                e.Row.Cells[6].Text = "Driver Name";
            }

        }
    }
}