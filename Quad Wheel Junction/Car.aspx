<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Car.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="clear:both"></div>

    <div style="color:grey;letter-spacing:5px;font-size:30px">
        CAR DETAILS
    </div>
    <hr />

    <div>
         <asp:GridView ID="CarGridView" runat="server" OnRowDataBound = "OnRowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" style="text-align:center">
             <FooterStyle BackColor="White" ForeColor="#000066" />
             <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"  />
             <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
             <RowStyle ForeColor="#000066" />
             <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#007DBB" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#00547E" />
         </asp:GridView>
     </div>
</asp:Content>
