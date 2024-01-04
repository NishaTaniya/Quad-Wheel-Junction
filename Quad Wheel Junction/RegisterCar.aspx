<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="RegisterCar.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register Car</title>
    <style>
       #lnk {
           color : red;
       }

       #last a:hover {
           text-decoration:underline;
       }

       .feature-car-rent-box-1 {
           top:150px;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="ftco-blocks-cover-1">
      <div class="ftco-cover-1 overlay" style="background-image: url('images/hero_1.jpg')">
        <div class="container-form">
          <div>
            <div class="col-lg-5" style="position:relative">
              <div class="feature-car-rent-box-1">
                <h3>Register Car</h3>
                <ul>
                
                  <li>
                     <div class="form-group form-element">
                                    
                        <asp:DropDownList type="text" ID="nameDropdown"  autopostback="true" class="add-border" placeholder="select" runat="server" OnSelectedIndexChanged="dropdown_SelectedIndexChanged">
                            <asp:ListItem Value="0">--SELECT CAR NAME--</asp:ListItem>
                            <asp:ListItem Value="1">Maruti Suzuki</asp:ListItem>
                            <asp:ListItem Value="2">Hyundai</asp:ListItem>
                            <asp:ListItem Value="3">Toyota</asp:ListItem>
                            <asp:ListItem Value="4">Tata</asp:ListItem>
                            <asp:ListItem Value="5">Mahindra</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpName" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="nameDropdown" runat="server"></asp:RequiredFieldValidator>
                      </div>
                  </li>
                  <li>
                     <div class="form-group form-element">
                        <asp:DropDownList type="text" ID="suzukiDropdown"  autopostback="true" class="add-border" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT MARUTI MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Dzire</asp:ListItem>
                            <asp:ListItem Value="2">XL6</asp:ListItem>
                            <asp:ListItem Value="3">Alto</asp:ListItem>
                            <asp:ListItem Value="4">Ertiga</asp:ListItem>
                            <asp:ListItem Value="5">Baleno</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpMaruti" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="suzukiDropdown" runat="server"></asp:RequiredFieldValidator>             
                     </div>
                  
                     <div class="form-group form-element">
                        <asp:DropDownList type="text" ID="hyundaiDropdown"  autopostback="true" class="add-border" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT HYUNDAI MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Tucson</asp:ListItem>
                            <asp:ListItem Value="2">i20</asp:ListItem>
                            <asp:ListItem Value="3">Kona</asp:ListItem>
                            <asp:ListItem Value="4">Elantra</asp:ListItem>
                            <asp:ListItem Value="5">Creta</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpHyundai" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="hyundaiDropdown" runat="server"></asp:RequiredFieldValidator>             
                     </div>

                    <div class="form-group form-element">
                        <asp:DropDownList type="text" ID="toyotaDropdown"  autopostback="true" class="add-border" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT TOYOTA MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Yaris</asp:ListItem>
                            <asp:ListItem Value="2">Carmy</asp:ListItem>
                            <asp:ListItem Value="3">Fortuner</asp:ListItem>
                            <asp:ListItem Value="4">Velfire</asp:ListItem>
                            <asp:ListItem Value="5">Urban Cruiser</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpToyota" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="toyotaDropdown" runat="server"></asp:RequiredFieldValidator>             
                     </div>

                    <div class="form-group form-element">
                        <asp:DropDownList type="text" ID="tataDropdown"  autopostback="true" class="add-border" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT TATA MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Tiago</asp:ListItem>
                            <asp:ListItem Value="2">Nexon</asp:ListItem>
                            <asp:ListItem Value="3">Harrier</asp:ListItem>
                            <asp:ListItem Value="4">Tigor</asp:ListItem>
                            <asp:ListItem Value="5">Alroz</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpTata" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="tataDropdown" runat="server"></asp:RequiredFieldValidator>             
                     </div>

                      <div class="form-group form-element">
                        <asp:DropDownList type="text" ID="mahindraDropdown"  autopostback="true" class="add-border" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT MAHINDRA MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Thar</asp:ListItem>
                            <asp:ListItem Value="2">XUV300</asp:ListItem>
                            <asp:ListItem Value="3">Baleno</asp:ListItem>
                            <asp:ListItem Value="4">Scorpio</asp:ListItem>
                            <asp:ListItem Value="5">Marazzo</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpMahindra" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="mahindraDropdown" runat="server"></asp:RequiredFieldValidator>             
                     </div>
                  </li>

                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="text" ID="txtseats"  class="full" placeholder="NUMBER OF SEATS" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="txt_seats"  class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtseats" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="validseat" runat="server" Display="Dynamic" ErrorMessage="Range is between 2 to 12" SetFocusOnError="True" ForeColor="Red" MaximumValue="12" MinimumValue="2" ControlToValidate="txtseats" Type="Integer"></asp:RangeValidator>
                                </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="text" ID="txtrates"  class="full" placeholder="RATES PER KM" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="checkrates"  class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtrates" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="txt_validexpr"   class="full-small"  runat="server" ControlToValidate="txtrates" Display="Dynamic" ErrorMessage="Enter only positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+(?:\.[0-9]+)?$"></asp:RegularExpressionValidator>
                                </div>
                  </li>

                    <li>
                        <div class="form-group form-element">
                                <asp:Button type="submit" ID="btnAdd" Text="ADD" class="btn btn-primary" runat="server" OnClick="btnAdd_Click"></asp:Button>
                                <asp:Button type="cancel" ID="btnCancel" Text="CANCEL"  class="btn btn-primary" runat="server" causesvalidation="false" OnClick="btnCancel_Click"></asp:Button>
                                    <br /> <br />
                                <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success" Visible="false">
                                    <asp:Button Text="X" ID="cross" style="background-color:#e3f2d9;width:10px;height:15px;float:right;border:none;padding:0;font-size:10px" runat="server" causesvalidation="false" OnClick="cross_Click" />
                                   
                                   Your Car Details are added successfully... <br /> Try adding more Cars or Try to Login...<br /> Happy Earning :)
                                </asp:Panel>
                        </div>
                    </li>

                     <li> 
                        <div id="last">
                            Already Registered? <a href="Login.aspx"><span id="lnk">Login Here</span></a>
                        </div>
                    </li>
                  
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> 
</asp:Content>
