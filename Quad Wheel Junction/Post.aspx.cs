using Bussiness_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Button = System.Web.UI.WebControls.Button;
using Label = System.Web.UI.WebControls.Label;
using Panel = System.Web.UI.WebControls.Panel;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace Quad_Wheel_Junction
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        BussinessClass bc = new BussinessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["user_type"] != null && Session["user_id"] != null)
                {
                    if (Session["user_type"].Equals("Customer"))
                    {
                        createPost.Visible = true;

                        bc.bussShowCustomerPost((Int32)Session["user_id"], CustomerPostDataList);
                        if (CustomerPostDataList.Items.Count == 0)
                            noPost.Visible = true;
                    }

                    else if (Session["user_type"].Equals("Driver"))
                    {
                        bc.bussShowCustomerPost(0,CustomerPostDataList);
                        if (CustomerPostDataList.Items.Count == 0)
                            noPost.Visible = true;
                    }
                }
            }
            
        }

        protected void create_Click(object sender, EventArgs e)
        {
            if(Session["user_id"]!=null)
            {
                bc.bussCreatePost((Int32)Session["user_id"], source.Text, destination.Text, member.Text, budget.Text, carDetails.Text, description.Text);
                PostStructure.Visible = false;
                MessageBox.Show("Post Created Successfully...");
                Response.Redirect("Post.aspx");
            }
        }

        protected void createPost_Click(object sender, EventArgs e)
        {
            PostStructure.Visible = true;
            cancelPost.Visible = true;
        }

        protected void cancelPost_Click(object sender, EventArgs e)
        {
            PostStructure.Visible = false;
            cancelPost.Visible = false;
        }

        protected void Item_Bound(Object sender, DataListItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label car = (Label)e.Item.FindControl("postCar");
                Label description = (Label)e.Item.FindControl("postDescription");
                Button delete = (Button)e.Item.FindControl("deletePost");
                HiddenField lblFinalDriver = (HiddenField)e.Item.FindControl("finalizePostDriver");

                if (car.Text=="")
                {
                    car.Text = "Not Specified";
                }

                if (description.Text=="")
                {
                    description.Text = "Not Specified";
                }

                if (Session["user_type"] != null && Session["user_Type"].Equals("Customer"))
                    delete.Visible = true;

                if(lblFinalDriver.Value=="")
                {
                    HiddenField lblPostId = (HiddenField)e.Item.FindControl("postId");
                    DataList commentDataList = (DataList)e.Item.FindControl("commentSection");
                    bc.bussShowComments(Int32.Parse(lblPostId.Value), commentDataList);
                }

                else
                {
                    Label CustomerName = (Label)e.Item.FindControl("CustomerName");
                    Label creator = (Label)e.Item.FindControl("creatorName");
                    Label finalDriver = (Label)e.Item.FindControl("finalDriver");

                    Panel finalizePanel = (Panel)e.Item.FindControl("finalizePanel");
                    Panel commentPanel = (Panel)e.Item.FindControl("commentSectionPanel");
                    Panel addCommentbtnPanel = (Panel)e.Item.FindControl("addCommentbtnPanel");


                    addCommentbtnPanel.Visible = false;
                    creator.Text = CustomerName.Text;
                    finalDriver.Text = lblFinalDriver.Value;
                    commentPanel.Visible = false;
                    finalizePanel.Visible = true;
                }
                                          
            }

        }

        protected void CommentItem_Bound(Object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField lblUserType = (HiddenField)e.Item.FindControl("commentCreatorType");
                DataListItem parentAddCommentbtnPanel = (DataListItem)e.Item.NamingContainer.NamingContainer;
                Button finalizeDeal = (Button)e.Item.FindControl("finalizeDeal");

                if (Session["user_type"]!=null && Session["user_type"].Equals("Customer"))
                {   
                    finalizeDeal.Visible = true;
                }

                if(lblUserType.Value == "False")
                {
                    Button name = (Button)e.Item.FindControl("commentCreator");
                    name.Text = "Customer";
                    name.ForeColor = System.Drawing.Color.Black;
                    
                    finalizeDeal.Visible = false;
                }

            }

        }

        protected void deletePost_Click(object sender, EventArgs e)
        {
            Button deletebtn = (Button)sender;
            DataListItem item = (DataListItem)deletebtn.NamingContainer;
            
            HiddenField lblPostId = (HiddenField)item.FindControl("postId");
            bc.bussDeletePost(Int32.Parse(lblPostId.Value));
            Response.Redirect("Post.aspx");
        }

        protected void addComment_Click(object sender, EventArgs e)
        {
            Button addCommentbtn = (Button)sender;
            DataListItem item = (DataListItem)addCommentbtn.NamingContainer;

            Panel commentPanel = (Panel)item.FindControl("comment");
            commentPanel.Visible = true;
            SetFocus(commentPanel);
        }

        protected void cancelComment_Click(object sender, EventArgs e)
        {
            Button cancelCommentbtn = (Button)sender;
            DataListItem item = (DataListItem)cancelCommentbtn.NamingContainer;

            Panel commentPanel = (Panel)item.FindControl("comment");
            commentPanel.Visible = false;

            Button addComment = (Button)item.FindControl("addComment");
            SetFocus(addComment);
        }

        protected void createComment_Click(object sender, EventArgs e)
        {
            if(Session["user_type"]!=null && Session["user_id"]!=null)
            {
                Button createCommentbtn = (Button)sender;
                DataListItem item = (DataListItem)createCommentbtn.NamingContainer;

                HiddenField lblPostId = (HiddenField)item.FindControl("postId");

                TextBox txtComment = (TextBox)item.FindControl("CommentData");
                bc.bussCreateComment(Int32.Parse(lblPostId.Value), (Int32)Session["user_id"], Session["user_type"].ToString(), txtComment.Text);

                Panel commentPanel = (Panel)item.FindControl("comment");
                commentPanel.Visible = false;

                DataList commentDataList = (DataList)item.FindControl("commentSection");
                bc.bussShowComments(Int32.Parse(lblPostId.Value), commentDataList);

                Button addComment = (Button)item.FindControl("addComment");
                SetFocus(addComment);

            }
        }

        protected void finalizeDeal_Click(object sender, EventArgs e)
        {
            Button finalizeDealbtn = (Button)sender;
            DataListItem commentItem = (DataListItem)finalizeDealbtn.NamingContainer;
            DataListItem postItem= (DataListItem)finalizeDealbtn.NamingContainer.NamingContainer.NamingContainer;

            HiddenField lblPostId = (HiddenField)postItem.FindControl("postId");
            Button username = (Button)commentItem.FindControl("commentCreator");

            Panel finalizePanel = (Panel)postItem.FindControl("finalizePanel");
            Panel commentPanel = (Panel)postItem.FindControl("commentSectionPanel");
            Panel addCommentbtnPanel = (Panel)postItem.FindControl("addCommentbtnPanel");
            
            Label creator = (Label)postItem.FindControl("creatorName");
            Label finalDriver = (Label)postItem.FindControl("finalDriver");
            Label CustomerName = (Label)postItem.FindControl("CustomerName");

            bc.bussFinalizeDriver(Int32.Parse(lblPostId.Value), username.Text);

            creator.Text = CustomerName.Text;
            finalDriver.Text = username.Text;
            addCommentbtnPanel.Visible = false;
            commentPanel.Visible = false;
            finalizePanel.Visible = true;
            
        }

        protected void username_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;

            if(button.Text!="Customer")
            {
                int id = bc.bussGetUserId("Driver", button.Text);
                Session["driver_Id"] = id;
                Server.Transfer("MyProfileD.aspx");
            }      
        }
    }
}