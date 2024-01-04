<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="RegisterDriver.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
                <h3>Register Driver</h3>
                <ul>
                  <li>
                      <div class="form-group form-element">
                     <asp:TextBox type="text" ID="txtusername" class="full" placeholder="USERNAME" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="txt_validusername" ForeColor="Red" Display="Dynamic" Text="*" ControlToValidate="txtusername" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                     <asp:CustomValidator ID="usernameValidator" class="full-small" runat="server" ControlToValidate="txtusername" Display="Dynamic" ErrorMessage="Username already Exist!!" ForeColor="Red" OnServerValidate="usernameValidator_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
                      </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="text" ID="txtname" class="full" placeholder="NAME" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txt_validname" class="full-small" Text="*" ForeColor="Red" Display="Dynamic" ControlToValidate="txtname" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="password" ID="txtpassword" class="full" placeholder="PASSWORD" runat="server" ></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="txt_validpassword" class="full-small"  ForeColor="Red" Text="*" ErrorMessage="password is required" Display="Dynamic" ControlToValidate="txtpassword" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexPassword"  class="full-small" ForeColor="Red"  ValidationExpression=".{8,20}" ErrorMessage="Password must be of atleast 8 to 20 characters" Display="Dynamic" ControlToValidate="txtpassword" SetFocusOnError="True"  runat="server"></asp:RegularExpressionValidator>
                                </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="password" ID="txtconfirm" class="full"  placeholder="CONFIRM PASSWORD" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="txt_confirpassword" class="full-small"  ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtconfirm" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="txt_validconfirm" class="full-small"  ControlToCompare="txtpassword" Display="Dynamic" ErrorMessage="Re-enter password" ForeColor="Red" runat="server" Text="confirm password must match to password" ControlToValidate="txtconfirm" SetFocusOnError="true" Type="String"></asp:CompareValidator>
                                </div>
                  </li>
                  <li>
                                <div class="form-group form-element">
                                    <asp:TextBox type="email" ID="txtemail" class="full" placeholder="EMAIL" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="full-small"  ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtemail" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class="full-small"  ForeColor="Red"  ErrorMessage="Invalid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ControlToValidate="txtemail" SetFocusOnError="True"  runat="server"></asp:RegularExpressionValidator>    
                                    <asp:CustomValidator ID="emailValidator" runat="server"  class="full-small" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="Email Id already Exist!!" ForeColor="Red" OnServerValidate="emailValidator_ServerValidate" SetFocusOnError="True"></asp:CustomValidator>
                                </div>
                  </li>

                    <li> 
                                <div class="form-group form-element">
                                    <asp:TextBox type="text" ID="txtphone" class="full" placeholder="PHONE" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="checkPhone"  class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtphone" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txt_validphone" class="full-small"  ForeColor="Red"  ValidationExpression="\d{10}" ErrorMessage="Invalid phone no." Display="Dynamic" ControlToValidate="txtphone" SetFocusOnError="True"  runat="server"></asp:RegularExpressionValidator>
                                </div>
                    </li>

                    <li>
                                 <div class="form-group form-element">
                                    <asp:TextBox type="text" ID="txtlocation" class="full" placeholder="BASE LOCATION" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txt_validloc"  class="full-small"  ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtlocation" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                </div>
                    </li>

                    <li>
                                 <div class="form-group  form-element">
                                    <asp:TextBox type="text" ID="txtLicenseno"  class="full" placeholder="LICENSE NO." runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="checkLicence"  class="full-small"  ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtLicenseno" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txt_validLicence"   class="full-small" runat="server" ControlToValidate="txtLicenseno" Display="Dynamic" ErrorMessage="Licence Number Format : SS-ddyyyyddddddd / SSdd yyyyddddddd" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$"></asp:RegularExpressionValidator>
                                </div>
                    </li>

                    <li>  
                                <div class="form-group">
                                    <asp:TextBox type="text" ID="txtexperience" class="full" placeholder="DRIVING EXPERIENCE(In Years) " runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="checkExpr"  class="full-small"  ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtexperience" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="txt_validexpr"   class="full-small"  runat="server" ControlToValidate="txtexperience" Display="Dynamic" ErrorMessage="Enter only positive Number" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[0-9]+(?:\.[0-9]+)?$"></asp:RegularExpressionValidator>
                                </div>
                    </li>
                    <li>
                        <div class="form-group form-element">
                                <asp:Button type="submit" ID="btnnext" Text="REGISTER" class="btn btn-primary" runat="server" OnClick="btnnext_Click"></asp:Button>
                                <asp:Button type="cancel" ID="btnCancel" Text="CANCEL"  class="btn btn-primary" runat="server" causesvalidation="false" OnClick="btnCancel_Click"></asp:Button>
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