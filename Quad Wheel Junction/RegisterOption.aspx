<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="RegisterOption.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <h3>Register Option</h3>
                <ul>
                
                  <li>
                                <div class="form-group form-element">
                                    <asp:DropDownList type="text" ID="dropdown" class="form-control" autopostback="true" placeholder="select" runat="server" OnSelectedIndexChanged="dropdown_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Register As</asp:ListItem>
                                        <asp:ListItem Value="1">Driver</asp:ListItem>
                                        <asp:ListItem Value="2">Customer</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="dropdown" runat="server"></asp:RequiredFieldValidator>
                                </div>
                  </li>

                    <li> 
                        <div id="last">
                            Already Registered? <a href="Login.aspx"><span id="#lnk">Login Here</span></a>
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
