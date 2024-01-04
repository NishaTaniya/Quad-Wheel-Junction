<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyProfileD.aspx.cs" Inherits="Quad_Wheel_Junction.MyProfileD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Driver Details</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <input type="button" value=" &lt;-- BACK " class="btn btn-dark" style="margin-left: 20px; margin-top: 20px" onclick="history.go(-1); return false;" />
        <div class="container" style="display:flex;margin-top:80px">
            <div class="container-fluid" style="width:50%;border:1px solid black;border-radius:5px;margin:10px;padding:20px">
                <div style="color:grey;letter-spacing:3px;font-size:25px">
                    BASIC DETAILS
                </div>
                <hr />
                <asp:DataList ID="DriverData" OnItemDataBound="Item_Bound" style="width:100%" runat="server">
                    <ItemTemplate>
                        <div class="row">
                           <div class="col-lg-6">Name : </div>
                           <div class="col-lg-6"><asp:Label ID="name" runat="server" Text='<%# Eval("name") %>'></asp:Label></div>
                       </div> 
                        <hr />
                       <div class="row">
                           <div class="col-lg-6">Email id : </div>
                           <div class="col-lg-6"><asp:Label ID="email" runat="server" Text='<%# Eval("emailId") %>'></asp:Label></div>
                       </div> 
                        <hr />
                       <div class="row">
                           <div class="col-lg-6">Phone Number : </div>
                           <div class="col-lg-6"><asp:Label ID="phone" runat="server" Text='<%# Eval("phoneNo") %>'></asp:Label></div>
                       </div> 
                        <hr />
                        <div class="row">
                           <div class="col-lg-6">Available Location : </div>
                           <div class="col-lg-6"><asp:Label ID="location" runat="server" Text='<%# Eval("location") %>'></asp:Label></div>
                       </div>
                        <hr />
                        <div class="row">
                           <div class="col-lg-6">Driving Experince(In Years) : </div>
                           <div class="col-lg-6"><asp:Label ID="expr" runat="server" Text='<%# Eval("experience") %>'></asp:Label></div>
                       </div>
                        <hr />
                        <div class="row">
                           <div class="col-lg-6">Licence Number : </div>
                           <div class="col-lg-6"><asp:Label ID="licence" runat="server" Text='<%# Eval("licenceNo") %>'></asp:Label></div>
                       </div>
                        <hr />

                        <div class="row">
                           <div class="col-lg-6">Rating : </div>
                           <div class="col-lg-6"><asp:Label ID="rating" runat="server" Text='<%# Eval("rating") %>'></asp:Label></div>
                       </div>
                        <hr />

                        <div class="row">
                           <div class="col-lg-6">Status : </div>
                           <div class="col-lg-6">
                    
                    <asp:Label ID="status" runat="server" Text='<%# Eval("status") %>'></asp:Label></div>
                       </div>
                    </ItemTemplate>
                </asp:DataList>  
            </div>

            <div class="container-fluid" style="width:50%;border:1px solid black;border-radius:5px;margin:10px;padding:20px">
                <div style="color:grey;letter-spacing:3px;font-size:25px">
                    CAR DETAILS
                 </div>
                <hr />
                
                <asp:GridView ID="carGrid" onrowdatabound="carGrid_RowDataBound" runat="server" CellPadding="3" ForeColor="Black" style="text-align:center;padding:5px" GridLines="Vertical" Width="463px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                  
            </div>
        </div>
    </form>
</body>
</html>
