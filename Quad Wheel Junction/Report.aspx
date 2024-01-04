<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #report {
            background-color:#1F305E;
            border-left:5px solid #e84545;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
   
    <div>
        <div style="color:grey;letter-spacing:5px;font-size:30px">
        HIGHEST RATED DRIVERS
    </div>

     <hr />
        <asp:GridView ID="DriverRates" OnRowDataBound = "OnRowDataBound_rates" runat="server" style="width:100%;text-align:center" BackColor="White" BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
            <AlternatingRowStyle BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" />
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    </div>
    <br />
    <br />
    <div>
        <div style="color:grey;letter-spacing:5px;font-size:30px">
        RECENTLY FINALIZE DRIVERS
    </div>

     <hr />
        <asp:GridView ID="FinalizeDriver" runat="server" OnRowDataBound = "OnRowDataBound_finalize" style="width:100%;text-align:center" BackColor="White" BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
            <AlternatingRowStyle BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" />
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    </div>   


</asp:Content>
