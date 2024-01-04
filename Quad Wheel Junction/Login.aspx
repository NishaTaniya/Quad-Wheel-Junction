<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home Page</title>
   <style>
        .feature-car-rent-box-1 {
           top:150px;
       }

       #lnk {
           color : red;
       }

       #last a:hover {
           text-decoration:underline;
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
                <h3>Login</h3>
                <ul>
                     
                  <li>
                                <div class="form-group form-element">
                                    <asp:DropDownList type="text" ID="dropdown" class="add-border" autopostback="true" placeholder="select" runat="server">
                                        <asp:ListItem Value="0">Login As</asp:ListItem>
                                        <asp:ListItem Value="1">Admin</asp:ListItem>
                                        <asp:ListItem Value="2">Driver</asp:ListItem>
                                        <asp:ListItem Value="3">Customer</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="reqCategory" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="dropdown" runat="server"></asp:RequiredFieldValidator>
                                </div>
                  </li>

                <li>
                      <div class="form-group form-element">
                            <asp:TextBox type="text" ID="txtusername" class="full" placeholder="USERNAME" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_validusername" class="full-small" ForeColor="Red" Text="*" Display="Dynamic" ControlToValidate="txtusername" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                     </div>
               </li>

               <li>
                      <div class="form-group form-element">
                             <asp:TextBox type="password" ID="txtpassword"  class="full" placeholder="PASSWORD" runat="server" ></asp:TextBox>
                             <asp:RequiredFieldValidator ID="txt_validpassword"  class="full-small" ForeColor="Red" Text="*"  Display="Dynamic" ControlToValidate="txtpassword" SetFocusOnError="True"  runat="server"></asp:RequiredFieldValidator>
                             <a href="ForgotPassword.aspx"><span style="float:right;font-size:15px"> <i>Forgot Password</i> </span> </a>
                      </div>
                 </li>

                 <li style="clear:both">
                        <div class="form-group form-element">
                                <asp:Button type="submit" ID="btnLogin" Text="LOGIN" class="btn btn-primary" runat="server" OnClick="btnLogin_Click"></asp:Button>
                                
                                <br /> <br />
                                <asp:Panel ID="DangerPanel" runat="server" CssClass="alert alert-danger" Visible="False">
                                     <asp:Button Text="X" ID="cross" style="background-color:#f8d7da;width:10px;height:15px;float:right;border:none;padding:0;font-size:10px" runat="server" causesvalidation="false" OnClick="cross_Click" />
                                   Invalid username or password!!! :( <br /> Try again... 
                                </asp:Panel>
                        </div>
                    </li>
                  
                    <li> 
                        <div id="last">
                            Not Registered? <a href="RegisterOption.aspx"><span id="lnk"> Register Here</span></a>
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
