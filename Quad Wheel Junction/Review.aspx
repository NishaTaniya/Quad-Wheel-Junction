<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #review {
            background-color:#1F305E;
            border-left:5px solid #e84545;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div style="color:grey;letter-spacing:5px;font-size:30px">
        RATE YOUR DRIVER SERVICE
    </div>
    <hr />

    <div><b>Note :</b>1 : not satisfying, 2 : satisfying, 3 : Good, 4 : Very Good, 5 : Excellent</div>
    <br />
    <br />
    <div>
        <asp:GridView ID="ReviewGridView" runat="server" OnRowDataBound = "OnRowDataBound" BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" Width="100%" BackColor="White" AlternatingRowStyle-BorderColor="Gray" AlternatingRowStyle-BorderStyle="Solid" AlternatingRowStyle-BorderWidth="2px">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
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
