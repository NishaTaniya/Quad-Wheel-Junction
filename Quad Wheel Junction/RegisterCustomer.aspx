<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="RegisterCustomer.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <h3>Register Customer</h3>
                <ul>
                  <li>
                      <div class="form-group form-element">
                    <asp:TextBox type="text" ID="txtusername" class="full" placeholder="USERNAME" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="txt_validusername" class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtusername" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="usernameValidator" class="full-small" runat="server" ControlToValidate="txtusername" Display="Dynamic" ErrorMessage="Username already Exist!!" ForeColor="Red" OnServerValidate="usernameValidator_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
                          </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="text" ID="txtname" class="full"  placeholder="NAME" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txt_validname"  class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtname" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="password" ID="txtpassword"  class="full" placeholder="PASSWORD" runat="server" ></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="txt_validpassword"  class="full-small" ForeColor="Red" Text="*"  Display="Dynamic" ControlToValidate="txtpassword" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexPassword"  class="full-small" ForeColor="Red"  ValidationExpression=".{8,20}" ErrorMessage="Password must be of atleast 8 to 20 characters" Display="Dynamic" ControlToValidate="txtpassword" SetFocusOnError="True"  runat="server"></asp:RegularExpressionValidator>
                                </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="password" ID="txtconfirm"  class="full" placeholder="CONFIRM PASSWORD" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="txt_confirpassword"  class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtconfirm" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="txt_validconfirm"  class="full" ControlToCompare="txtpassword" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Confirm password must match to password" ControlToValidate="txtconfirm" SetFocusOnError="true" Type="String"></asp:CompareValidator>
                                </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="email" ID="txtemail"  class="full" placeholder="EMAIL" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="checkEmail"  class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtemail" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                      <asp:RegularExpressionValidator ID="txt_validemail"  class="full-small" ForeColor="Red"  ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ControlToValidate="txtemail" SetFocusOnError="True"  runat="server"></asp:RegularExpressionValidator>    
                                    <asp:CustomValidator ID="emailValidator" runat="server"  class="full-small" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="Email Id already Exist!!" ForeColor="Red" OnServerValidate="emailValidator_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
                                </div>
                  </li>

                    <li> 
                                <div class="form-group form-element">
                                    <asp:TextBox type="text" ID="txtphone"  class="full" placeholder="PHONE" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="checkPhone"  class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtphone" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txt_validphone"  class="full-small" ForeColor="Red"  ValidationExpression="\d{10}" ErrorMessage="Invalid phone no." Display="Dynamic" ControlToValidate="txtphone" SetFocusOnError="True"  runat="server"></asp:RegularExpressionValidator>
                                </div>
                    </li>

                    <li>
                                 <div class="form-group form-element">
                                    <asp:TextBox type="text" ID="txtlocation"  class="full" placeholder="BASE LOCATION" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txt_validloc"  class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtlocation" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                </div>
                    </li>

                    <li>
                        <div class="form-group form-element">
                                <asp:Button type="submit" ID="btnCustomer" Text="REGISTER" class="btn btn-primary" runat="server" OnClick="btnCustomer_Click"></asp:Button>
                                <asp:Button type="cancel" ID="btnCancel" Text="CANCEL"  class="btn btn-primary" runat="server" causesvalidation="false" OnClick="btnCancel_Click"></asp:Button>
                            <br /> <br />
                                <asp:Panel ID="SuccessPanel" runat="server" CssClass="alert alert-success" Visible="False">
                                    <asp:Button Text="X" ID="cross" style="background-color:#e3f2d9;width:10px;height:15px;float:right;border:none;padding:0;font-size:10px" runat="server" causesvalidation="false" OnClick="cross_Click" />
                                   Your Account is created successfully...<br /> Happy Browsing :) 
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
