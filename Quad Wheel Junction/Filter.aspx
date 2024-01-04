<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Filter.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #filter {
            background-color:#1F305E;
            border-left:5px solid #e84545;
        }

        .filter-value div {
            width:30%;
            padding : 10px;
        }

        .userStyle {
            border: none;
            background-color: white;
            color : #4b778d;
            font-weight:700;
        }  
        
        .userStyle:hover {
            text-decoration:underline;
        }

        .data {
            color : #4b778d;
            font-weight:700;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div style="color:grey;letter-spacing:5px;font-size:30px">
        FILTER DRIVER
    </div>
    <hr />
    <div class="filter-value" style="display:flex;width:100%">
        <div>
            <asp:DropDownList ID="mainDrop" class="form-select" autopostback="true" aria-label="Default select example" runat="server" OnSelectedIndexChanged="mainDrop_SelectedIndexChanged">
                <asp:ListItem>--SELECT FILTER CATEGORY--</asp:ListItem>
                <asp:ListItem>Location</asp:ListItem>
                <asp:ListItem>Rate per KM</asp:ListItem>
                <asp:ListItem>Car Name</asp:ListItem>
                <asp:ListItem>Driver Name</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="reqCategory" runat="server" ControlToValidate="mainDrop" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>

        <div>
            <asp:TextBox ID="txtlocation" placeholder="Enter Location" class="form-control" Visible="false" runat="server"></asp:TextBox>

            <asp:TextBox ID="txtrate" placeholder="Enter Rate per KM" class="form-control" Visible="false" runat="server"></asp:TextBox>

            <asp:DropDownList type="text" ID="nameDropdown" class="form-select" placeholder="select" Visible="false" runat="server">
                                <asp:ListItem Value="0">Maruti Suzuki</asp:ListItem>
                                <asp:ListItem Value="1">Hyundai</asp:ListItem>
                                <asp:ListItem Value="2">Toyota</asp:ListItem>
                                <asp:ListItem Value="3">Tata</asp:ListItem>
                                <asp:ListItem Value="4">Mahindra</asp:ListItem>
            </asp:DropDownList>

            <asp:TextBox ID="txtdriver" placeholder="Enter Driver Name" class="form-control" Visible="false" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Button Text="Search" ID="btnSearch" class="btn btn-dark" Visible="false"  runat="server" OnClick="btnSearch_Click" />
        </div>
        <br />
        <hr />
   </div>

    <div style="width:100%;color:#53354a">     
        <asp:DataList ID="filterData" runat="server" OnItemDataBound="Item_Bound" autopostback="true" style="width:100%">
           <ItemTemplate>
                    <hr style="color:dimgray" />
                    <!--<asp:Label ID="driverId" class="data" runat="server" Text='<%# Eval("driverId") %>'></asp:Label>&nbsp;-&nbsp;-->
                    <asp:Button ID="username" class="userStyle" runat="server" Text='<%# Eval("username") %>' OnClick="username_Click"></asp:Button>
                     &nbsp;-&nbsp; Rating : 
                    <asp:Label ID="rating" class="data" runat="server" Text='<%# Eval("rating") %>' />
                    ( Status : 
                    <asp:Label ID="status" class="data" runat="server" Text='<%# Eval("status") %>' />  ) 
                    <br />
                    Phone Number : 
                    <asp:Label ID="phoneNo" class="data" runat="server" Text='<%# Eval("phoneNo") %>'></asp:Label>
                    &nbsp;&nbsp; Email : 
                    <asp:Label ID="emailId" class="data" runat="server" Text='<%# Eval("emailId") %>'></asp:Label>

           </ItemTemplate>

        </asp:DataList>
    </div>

</asp:Content>