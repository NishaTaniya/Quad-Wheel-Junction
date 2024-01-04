<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #post {
            background-color:#1F305E;
            border-left:5px solid #e84545;
        }

        .userStyle {
            border: none;
            background-color: white;
            color:cadetblue;
            font-weight:700;
            font-size:18px;
        }  
        
        .userStyle:hover {
            text-decoration:underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div style="float:right">
        <asp:Button Text="Create Post" ID="createPost" class="btn btn-dark" style="margin:10px" runat="server" causesvalidation="false" OnClick="createPost_Click" Visible="false" />
        <asp:Button Text="Cancel Post" ID="cancelPost" class="btn btn-dark" runat="server" causesvalidation="false" OnClick="cancelPost_Click" Visible="false" />
    </div>
    <br />
    <br />
    
    <asp:Panel ID="PostStructure" runat="server" style="width:60%;margin:auto;clear:both" Visible="false">
        <div class="container:fluid" style="width:90%;border:1px solid black;border-radius:5px;margin:auto;padding:10px">
            <div style="color:grey;letter-spacing:3px;font-size:20px">
                     CREATE POST
            </div>
            <hr />

            <div class="row">
                <div class="col-md-12">
                  <asp:TextBox ID="source" class="form-control" placeholder="SOURCE LOCATION" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="reqSource" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="source" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>  
                </div>
            </div>

                <br />

            <div class="row">
                <div class="col-md-12">
                    <asp:TextBox ID="destination" class="form-control" placeholder="DESTINATION LOCATION" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqDestination" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="destination" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>  
                </div>
            </div>
            
            <br />

            <div class="row">
                <div class="col-md-6">
                    <asp:TextBox ID="member" class="form-control" placeholder="EXPECTED NUMBER OF MEMBERS" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqMember" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="member" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>  
                    <asp:RegularExpressionValidator ID="validMember" runat="server" ControlToValidate="member" Display="Dynamic" ErrorMessage="Enter positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                </div>

                <div class="col-md-6">
                    <asp:TextBox ID="budget" class="form-control" placeholder="PREFERABLE RUPEES PER KM" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqBudget" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="budget" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>  
                    <asp:RegularExpressionValidator ID="validateBudget" runat="server" ControlToValidate="budget" Display="Dynamic" ErrorMessage="Enter positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+(?:\.[0-9]+)?$"></asp:RegularExpressionValidator>
                </div>
            </div>

            <br />

            <div class="row">
                <div class="col-md-12">
                   <asp:TextBox ID="carDetails" class="form-control" placeholder="EXPECTED CAR REQUIREMENTS (optional)" runat="server"></asp:TextBox> 
                </div>
            </div>
                <br />

            <div class="row">
                <div class="col-md-12">
                    <asp:Textbox ID="description" class="form-control" placeholder="OTHER REQUIREMENTS (optional)"  runat="server" Rows="5" TextMode="MultiLine" />
                </div>
            </div>
            <br />
            <div style="width:20%;margin:auto">
                <asp:Button ID="create" class="btn btn-dark"  Text="create" runat="server" OnClick="create_Click" />
            </div>
        </div>
         
    </asp:Panel>
  
    <br />
    <asp:Panel ID="CustomerPostPanel" style="width:70%;margin:auto" runat="server">
        <div style="color:grey;letter-spacing:3px;font-size:20px">
            POST         
        </div>
        <hr />

            <asp:DataList ID="CustomerPostDataList" OnItemDataBound="Item_Bound" Width="100%" runat="server">
            
            <ItemTemplate>
            <div style="border:2px solid black;border-radius:5px;padding:20px;margin:20px;width:95%;font-size:15px;font-weight:400">
                <asp:HiddenField ID="postId" Value='<%# Eval("postId") %>' runat="server" />
                <asp:HiddenField ID="finalizePostDriver" Value='<%# Eval("finalizeDriver") %>' runat="server" />
                <div class="row">
                    <div class="col-md-9" style="color:cadetblue;font-size:20px;">
                       <i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="CustomerName" Text='<%# Eval("name") %>' runat="server" />
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="deletePost" class="btn btn-dark" Text="Delete Post" runat="server" causesvalidation="false" OnClick="deletePost_Click" Visible="false" />
                    </div>
                </div>
                
                <hr />

                <div class="row">
                    <div class="col-md-6">
                        <b>Source Location :</b> <asp:Label ID="postSource" Text='<%# Eval("source") %>' runat="server" />
                    </div>
                    <div class="col-md-6">
                        <b>Destination Location :</b> <asp:Label ID="postDestination" Text='<%# Eval("destination") %>' runat="server" />
                    </div>
                </div>

                <br />

                <div class="row">
                    <div class="col-md-6">
                        <b>Number of Passengers :</b> <asp:Label ID="postMember" Text='<%# Eval("member") %>' runat="server" />
                    </div>
                    <div class="col-md-6">
                        <b>Max budget :</b> <asp:Label ID="postBudget" Text='<%# Eval("budget") %>' runat="server" /> rs. per KM
                    </div>
                </div>
                
                <br />

                <div class="row">
                    <div class="col-md-12">
                        <b>Car details :</b> <asp:Label ID="postCar" Text='<%# Eval("car") %>' runat="server" />
                    </div>
                </div>

                <br />

                <div class="row">
                    <div class="col-md-12">
                        <b>Description :</b> <asp:Label ID="postDescription" Text='<%# Eval("description") %>' runat="server" />
                    </div>
                </div>

                <br />

                <asp:Panel ID="addCommentbtnPanel" runat="server">
                    <div class="row">
                        <div class="col-md-12" style="text-align:center;background-color:lightgray;padding:10px">
                            <asp:Button ID="addComment" Text="Add Comment" class="btn btn-dark" causesvalidation="false"  OnClick="addComment_Click" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
                

                <br />

                <asp:Panel ID="comment" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Textbox ID="commentData" class="form-control" placeholder="Comment Content" runat="server" Rows="3" TextMode="MultiLine" />
                            <asp:RequiredFieldValidator ID="reqComment" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="commentData" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>  
                        </div>
                        
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12" style="text-align:center">
                            <asp:Button ID="createComment" Text="Add"  class="btn btn-dark" OnClick="createComment_Click" runat="server" />
                            <asp:Button ID="cancelComment" Text="Cancel" class="btn btn-dark" OnClick="cancelComment_Click" causesvalidation="false" runat="server" />
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="finalizePanel" style="text-align:center;font-size:20px" runat="server" Visible="false">
                    <hr />
                    <b><asp:Label ID="creatorName" Text="" runat="server" /></b>
                    <span> has finalize the Driver ==> </span>
                    <b><asp:Label ID="finalDriver" Text="" runat="server" /></b>
                </asp:Panel>
                              
                <asp:Panel ID="commentSectionPanel" runat="server">
                    <div style="color:grey;letter-spacing:3px;font-size:20px">
                                COMMENT SECTION        
                     </div>
                     <hr />

                        <asp:DataList ID="commentSection" OnItemDataBound="CommentItem_Bound" Width="100%" runat="server">
                        <ItemTemplate>
                            <div class="row" style="margin:5px 0;border-bottom:1px solid gray;padding-bottom:5px">
                                <div class="col-md-10">
                                    <asp:HiddenField ID="commentCreatorType" Value='<%# Eval("userType") %>' runat="server" />
                                    
                                     <asp:Button ID="commentCreator" class="userStyle" Text='<%# Eval("username") %>' causesvalidation="false"  OnClick="username_Click" runat="server" />
                                    <br />
                                    <asp:Label ID="commentContent" Text='<%# Eval("commentData") %>' runat="server" />
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="finalizeDeal" Text="finalize" class="btn btn-dark" causesvalidation="false"  OnClick="finalizeDeal_Click" runat="server" Visible="false" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                </asp:Panel>

            </div>
                
            </ItemTemplate>
            
        </asp:DataList>

            <asp:Panel ID="noPost" runat="server" style="border:2px solid black;border-radius:5px;padding:20px;margin:20px;width:95%;text-align:center;font-size:20px;font-weight:700;text-shadow:2px 2px 2px lightgray;color:cadetblue" Visible="false">
                No Post Created Yet!!!
            </asp:Panel>
        
    </asp:Panel>

    <asp:Panel ID="DriverPost" runat="server">

    </asp:Panel>
</asp:Content>
