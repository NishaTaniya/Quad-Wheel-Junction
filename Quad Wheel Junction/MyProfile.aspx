<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>My Profile</title>
    <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />-->
    <style>
        #profile {
            background-color:#1F305E;
            border-left:5px solid #e84545;
        }

        .left a {
            text-decoration:none;
            color : white;
            font-size:20px;
            width:100%;
            height:100%;
        }

        .left li:hover {
           background-color:#1F305E;
           border-left:5px solid #e84545;
        }

        .set-margin {
            margin : 20px 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div class="container-fluid" style="width:95%;margin:10px;padding:20px">
        <asp:Button Text="Update Profile" ID="updateProfile" class="btn btn-dark" style="float:right;margin-right:20px" runat="server" causesvalidation="false" OnClick="updateProfile_Click" />
        <br />
                <asp:Panel ID="BasicPanel" runat="server">
                    <div style="color:grey;letter-spacing:3px;font-size:25px">
                    BASIC DETAILS
                </div>
                <hr />

                        <div class="row">
                           <div class="col-lg-6"><b>Name :</b> </div>
                           <div class="col-lg-6"><asp:TextBox ID="name" style="width:90%" runat="server" Enabled="false"></asp:TextBox></div>
                       </div> 
                        <hr />
                       <div class="row">
                           <div class="col-lg-6"><b>Email id :</b> </div>
                           <div class="col-lg-6">
                               <asp:TextBox ID="email" style="width:90%" runat="server" Enabled="false"></asp:TextBox><br />
                               <asp:RequiredFieldValidator ID="reqEmail" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="email" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="checkEmail"  ForeColor="Red"  ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ControlToValidate="email" SetFocusOnError="True"  runat="server"></asp:RegularExpressionValidator>    
                               <asp:CustomValidator ID="emailValidator" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Email Id already Exist!!" ForeColor="Red" OnServerValidate="emailValidator_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
                           </div>
                       </div> 
                        <hr />
                       <div class="row">
                           <div class="col-lg-6"><b>Phone Number :</b> </div>
                           <div class="col-lg-6"><asp:TextBox ID="phone" style="width:90%" runat="server"  Enabled="false"></asp:TextBox><br />
                               <asp:RequiredFieldValidator ID="checkPhone" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="phone" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="txt_validphone"  ForeColor="Red"  ValidationExpression="\d{10}" ErrorMessage="invalid phone no." Display="Dynamic" ControlToValidate="phone" SetFocusOnError="True"  runat="server"></asp:RegularExpressionValidator>
                           </div>

                            
                       </div> 
                        <hr />
                        <div class="row">
                           <div class="col-lg-6"><b>Available Location :</b> </div>
                           <div class="col-lg-6"><asp:TextBox ID="location" style="width:90%" runat="server"  Enabled="false"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="txt_validloc" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="location" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                           </div>
                       </div>
                    
                    <div style="width:10%;margin:auto;margin-top:10px">
                        <asp:Button Text="Update" ID="updateCustomer" style="width:100%" class="btn btn-dark"  runat="server" Visible="false" OnClick="updateCustomer_Click" />
                    </div>
                </asp:Panel>
                
          <asp:Panel runat="server" ID="DriverPanel">
               
                        <hr />
                        <div class="row">
                           <div class="col-lg-6"><b>Driving Experince(In Years) :</b></div>
                           <div class="col-lg-6"><asp:TextBox ID="expr" style="width:90%" runat="server" Enabled="false"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="checkExpr"  ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="expr" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="txt_validexpr"  runat="server" ControlToValidate="expr" Display="Dynamic" ErrorMessage="Enter only positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+(?:\.[0-9]+)?$"></asp:RegularExpressionValidator>
                           </div>
                       </div>
                        <hr />
                        <div class="row">
                           <div class="col-lg-6"><b>Licence Number : </b></div>
                           <div class="col-lg-6"><asp:TextBox ID="licence" style="width:90%" runat="server" Enabled="false"></asp:TextBox></div>
                       </div>
                        <hr />

                        <div class="row">
                           <div class="col-lg-6"><b>Your Rating : </b></div>
                           <div class="col-lg-6"><asp:TextBox ID="rating" style="width:90%" runat="server" Enabled="false"></asp:TextBox></div>
                       </div>
                        <hr />

                        <div class="row">
                           <div class="col-lg-6"><b>Status</b></div>
                           <div class="col-lg-6">
                               <asp:TextBox ID="stateText" style="width:90%" runat="server" Enabled="false"/>
                               <asp:CheckBox ID="state" runat="server" Visible="false" /></div>
                        </div>
              
                <br />
              <div style="width:10%;margin:auto">
                <asp:Button Text="Update" ID="updateDriver" style="width:100%" class="btn btn-dark"  runat="server" Visible="false" OnClick="updateDriver_Click" />
              </div>
              
                <div style="color:grey;letter-spacing:3px;font-size:25px">
                    CAR DETAILS
                 </div>
                <hr />
                
              <div style="width:100%">
                <asp:GridView ID="carGrid" onrowdatabound="carGrid_RowDataBound" runat="server" CellPadding="3" ForeColor="Black" style="text-align:center;padding:5px;width:70%" GridLines="Vertical" Width="463px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
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
              <br />
              
              <asp:Button Text="Update Rates" ID="updateRate" class="btn btn-dark set-margin" runat="server" causesvalidation="false" OnClick="updateRate_Click" />
              <asp:Button Text="Add Cars" ID="addCar" class="btn btn-dark set-margin" runat="server" causesvalidation="false" OnClick="addCar_Click" />
              <asp:Button Text="Delete Cars" ID="deleteCar" class="btn btn-dark set-margin" runat="server"  causesvalidation="false" OnClick="deleteCar_Click" />

              <br />
              <asp:Panel ID="update" style="width:90%;border:1px solid black;border-radius:3px;padding:15px" runat="server" Visible="false">
                  <div style="color:grey;letter-spacing:3px;font-size:20px">
                    UPDATE RATE
                 </div>
                <hr />

                  <div class="row">
                      <div class="col-md-4">
                      <asp:TextBox ID="updateId" placeholder="Enter car Id for update" class="form-control" runat="server" />
                      <asp:RequiredFieldValidator ID="checkId" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="updateId" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="validateId" runat="server" ControlToValidate="updateId" Display="Dynamic" ErrorMessage="Enter only positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                  </div>

                  <div class="col-md-4">
                    <asp:TextBox ID="updateCarRate" placeholder="Enter Rate per KM" class="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="reqRates" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="updateCarRate" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validateRates" runat="server" ControlToValidate="updateCarRate" Display="Dynamic" ErrorMessage="Enter only positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+(?:\.[0-9]+)?$"></asp:RegularExpressionValidator>
                  </div>

                    <div class="col-md-4">
                      <asp:Button ID="finalUpdate" class="btn btn-dark" Text="Update" runat="server" OnClick="finalUpdate_Click" />
                  </div>
                  </div>
                                    
              </asp:Panel>

              <asp:Panel ID="add" style="width:90%;border:1px solid black;border-radius:3px;padding:15px" runat="server" Visible="false">
                  <div style="color:grey;letter-spacing:3px;font-size:20px">
                     ADD CAR
                 </div>
                  <hr />
                  <div class="row">
                    <div class="col-md-3">            
                        <asp:DropDownList type="text" ID="nameDropdown"  autopostback="true" class="form-select" runat="server" OnSelectedIndexChanged="dropdown_SelectedIndexChanged">
                            <asp:ListItem Value="0">--SELECT CAR NAME--</asp:ListItem>
                            <asp:ListItem Value="1">Maruti Suzuki</asp:ListItem>
                            <asp:ListItem Value="2">Hyundai</asp:ListItem>
                            <asp:ListItem Value="3">Toyota</asp:ListItem>
                            <asp:ListItem Value="4">Tata</asp:ListItem>
                            <asp:ListItem Value="5">Mahindra</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpName" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="nameDropdown" runat="server"></asp:RequiredFieldValidator>
                    </div>
                  
                     <div class="col-md-3">
                        <asp:DropDownList type="text" ID="suzukiDropdown" class="form-select" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT MARUTI MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Dzire</asp:ListItem>
                            <asp:ListItem Value="2">XL6</asp:ListItem>
                            <asp:ListItem Value="3">Alto</asp:ListItem>
                            <asp:ListItem Value="4">Ertiga</asp:ListItem>
                            <asp:ListItem Value="5">Baleno</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpMaruti" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="suzukiDropdown" runat="server"></asp:RequiredFieldValidator>             
                     
                        <asp:DropDownList type="text" ID="hyundaiDropdown" class="form-select" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT HYUNDAI MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Tucson</asp:ListItem>
                            <asp:ListItem Value="2">i20</asp:ListItem>
                            <asp:ListItem Value="3">Kona</asp:ListItem>
                            <asp:ListItem Value="4">Elantra</asp:ListItem>
                            <asp:ListItem Value="5">Creta</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpHyundai" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="hyundaiDropdown" runat="server"></asp:RequiredFieldValidator>             
                     
                        <asp:DropDownList type="text" ID="toyotaDropdown" class="form-select" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT TOYOTA MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Yaris</asp:ListItem>
                            <asp:ListItem Value="2">Carmy</asp:ListItem>
                            <asp:ListItem Value="3">Fortuner</asp:ListItem>
                            <asp:ListItem Value="4">Velfire</asp:ListItem>
                            <asp:ListItem Value="5">Urban Cruiser</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpToyota" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="toyotaDropdown" runat="server"></asp:RequiredFieldValidator>             
                     
                        <asp:DropDownList type="text" ID="tataDropdown" class="form-select" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT TATA MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Tiago</asp:ListItem>
                            <asp:ListItem Value="2">Nexon</asp:ListItem>
                            <asp:ListItem Value="3">Harrier</asp:ListItem>
                            <asp:ListItem Value="4">Tigor</asp:ListItem>
                            <asp:ListItem Value="5">Alroz</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpTata" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="tataDropdown" runat="server"></asp:RequiredFieldValidator>             
                     
                        <asp:DropDownList type="text" ID="mahindraDropdown" class="form-select" placeholder="select" runat="server" Visible="false">
                            <asp:ListItem Value="0">--SELECT MAHINDRA MODEL--</asp:ListItem>
                            <asp:ListItem Value="1">Thar</asp:ListItem>
                            <asp:ListItem Value="2">XUV300</asp:ListItem>
                            <asp:ListItem Value="3">Baleno</asp:ListItem>
                            <asp:ListItem Value="4">Scorpio</asp:ListItem>
                            <asp:ListItem Value="5">Marazzo</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="drpMahindra" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="mahindraDropdown" runat="server"></asp:RequiredFieldValidator>             
                     </div>
                  <br />
                  <br />
                  <div class="col-md-3">
                      <asp:TextBox type="text" ID="seats"  class="form-control" placeholder="Enter seats available" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="txt_seats" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="seats" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                      <asp:RangeValidator ID="validseat" runat="server" Display="Dynamic" ErrorMessage="Range is between 2 to 12" SetFocusOnError="True" ForeColor="Red" MaximumValue="12" MinimumValue="2" ControlToValidate="seats" Type="Integer"></asp:RangeValidator>
                  </div>

                  <div class="col-md-3">
                    <asp:TextBox ID="addRate" placeholder="Enter Rate per KM" class="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="reqRate" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="addRate" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validRate" runat="server" ControlToValidate="addRate" Display="Dynamic" ErrorMessage="Enter only positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+(?:\.[0-9]+)?$"></asp:RegularExpressionValidator>
                  </div>
                  </div>
                  
                  <div style="width:20%;margin:auto;margin-top:10px">
                    <asp:Button ID="finalAdd" class="btn btn-dark" style="padding:8px 25px;text-align:center" Text="Add" runat="server" OnClick="finalAdd_Click" />
                  </div>
                  
              </asp:Panel>

              <asp:Panel ID="delete" style="width:90%;border:1px solid black;border-radius:3px;padding:15px" runat="server" Visible="false">
                  <div style="color:grey;letter-spacing:3px;font-size:20px">
                     DELETE CAR
                 </div>
                  <hr />
                  <div class="row">
                    <div class="col-md-4">
                      <asp:TextBox ID="deleteId" placeholder="Enter car Id for delete" class="form-control" runat="server" />
                      <asp:RequiredFieldValidator ID="reqId" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="updateId" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="numberId" runat="server" ControlToValidate="updateId" Display="Dynamic" ErrorMessage="Enter only positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                  </div>

                    <div class="col-md-4">
                       <asp:Button ID="finalDelete" class="btn btn-dark" Text="Delete" runat="server" OnClick="finalDelete_Click" />
                  </div>
                  </div>
                     
              </asp:Panel>
          </asp:Panel>
        </div>         
</asp:Content>
