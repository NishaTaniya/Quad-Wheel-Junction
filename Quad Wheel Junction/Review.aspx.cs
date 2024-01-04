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
    public partial class WebForm14 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user_type"] != null && Session["user_type"].Equals("Driver"))
            {
                Response.Redirect("Login.aspx");
            }

            bc.bussGetDetailsForReview(ReviewGridView);
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Driver Id";
                e.Row.Cells[1].Text = "Driver Username";
                e.Row.Cells[2].Text = "Driver Name";
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                cell1.Text = "Rating Option";
                cell2.Text = "Complete";
                e.Row.Cells.Add(cell1); e.Row.Cells.Add(cell2);

            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();
                RadioButtonList ratingList = new RadioButtonList();
                ListItem li1 = new ListItem(); li1.Text = "1  ";  li1.Value = "1"; 
                ListItem li2 = new ListItem(); li2.Text = "2  ";  li2.Value = "2";
                ListItem li3 = new ListItem(); li3.Text = "3  "; li3.Value = "3";
                ListItem li4 = new ListItem(); li4.Text = "4  ";  li4.Value = "4";
                ListItem li5 = new ListItem(); li5.Text = "5  "; li5.Value = "5";

                ratingList.Items.Add(li1); ratingList.Items.Add(li2); ratingList.Items.Add(li3);
                ratingList.Items.Add(li4); ratingList.Items.Add(li5);
                ratingList.ID = "ratingRadio";

                ratingList.RepeatDirection = RepeatDirection.Horizontal;
                LinkButton lnkComplete = new LinkButton();
                lnkComplete.ID = "lnkComplete";
                lnkComplete.Text = "Complete";
                lnkComplete.Click += storeRating;

                cell1.Controls.Add(ratingList);
                cell2.Controls.Add(lnkComplete);
                e.Row.Cells.Add(cell1);      e.Row.Cells.Add(cell2);
            }
        }

        private void storeRating(object sender, EventArgs e)
        {
            LinkButton lnkComplete = (sender as LinkButton);
            GridViewRow row = (lnkComplete.NamingContainer as GridViewRow);

            String id = row.Cells[0].Text.ToString();
            RadioButtonList ratingList = (RadioButtonList)row.Cells[3].FindControl("ratingRadio");
            // MessageBox.Show(ratingList.SelectedValue);

            bc.bussUpdateRate(Int32.Parse(id),ratingList.SelectedValue);
            MessageBox.Show("Thank you for your Review...");

            if (ratingList.SelectedItem.Selected)
            ratingList.SelectedItem.Selected = false;
        }
    }
}