<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Quad_Wheel_Junction.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <style>
        body {
            width : 30%;
            margin : auto;
            margin-top:250px;
            border :2px solid grey;
            padding : 20px;
        }
       span {
           color : red;
       }

       a:hover {
           text-decoration:underline;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:DropDownList type="text" ID="dropdown" class="form-control" autopostback="true" placeholder="select" runat="server">
             <asp:ListItem Value="0">SELECT CATEGORY</asp:ListItem>
             <asp:ListItem Value="1">Driver</asp:ListItem>
             <asp:ListItem Value="2">Customer</asp:ListItem>
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="reqCategory" Display="Dynamic" ErrorMessage="select any one" ForeColor="Red" SetFocusOnError="True" Text="*"  ControlToValidate="dropdown" runat="server"></asp:RequiredFieldValidator>
        </div>

        <br />

        <div class="form-group">
            <asp:Label ID="forEmail" runat="server"  AssociatedControlID="forEmailtxt" style="font-family: 'Overlock SC', cursive;color:black;font-size:20px"> Enter Valid Email : </asp:Label>
            <br />
            <asp:TextBox ID="forEmailtxt" runat="server" style="width:100%;font-size:20px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="forEmailtxt" Display="Dynamic" ErrorMessage="*" ForeColor="brown" SetFocusOnError="True">*</asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="exprValEmail" runat="server" ControlToValidate="forEmailtxt" Display="Dynamic" ErrorMessage="Invalid Email" ForeColor="brown" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@gmail.com"></asp:RegularExpressionValidator>
         </div>


        <br />

        <div style="width:100px">
        <asp:Button runat="server" ID="buttonSend" Text="send" style="width:100%" class="btn btn-primary item-button" OnClick="buttonSend_Click"> </asp:Button> 
        </div>

        <br />
        <div>
            <p> Want to Login? <a href="Login.aspx"><span>Login Here</span></a></p>
        </div>
    </form>
</body>
</html>
