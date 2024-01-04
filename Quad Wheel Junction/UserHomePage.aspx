<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="UserHomePage.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        #home {
            background-color:#1F305E;
            border-left:5px solid #e84545;
        }

        .carousel-control-prev-icon {
            background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQGHYFa67pmB9Jm7ZLkmJq9I9qEb-gHLcOSw&usqp=CAU);
        }

        .carousel-control-next-icon {
            background-image:url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcmjtLWh2kSsJpBaQTdaJEEgfospg8HBFYGw&usqp=CAU);
        }

        .content-style {
            text-shadow:2px 2px 3px black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="container mt-3">

        <!--Carousel Wrapper-->
        <div id="carousel-example-2" class="carousel slide carousel-fade z-depth-1-half" data-ride="carousel">
            <!--Indicators-->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-2" data-slide-to="1"></li>
                <li data-target="#carousel-example-2" data-slide-to="2"></li>
            </ol>
            <!--/.Indicators-->
            <!--Slides-->
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active" style="height:500px">
                    <div class="view" style="height:100%">
                        <img class="d-block w-100" src="images/carimage.jpg" alt="First slide" style="height:100%">
                        <div class="mask rgba-black-light"></div>
                    </div>
                    <div class="carousel-caption">
                        <h3 class="h3-responsive content-style">Find A Car</h3>
                        <h5 class="content-style">A Perfect Place To Find Private Cars.</h5>
                    </div>
                </div>
                <div class="carousel-item" style="height:500px">
                    <!--Mask color-->
                    <div class="view" style="height:100%">
                        <img class="d-block w-100" src="images/carrent.jpg" alt="Second slide" style="height:100%">
                        <div class="mask rgba-black-strong"></div>
                    </div>
                    <div class="carousel-caption">
                        <h3 class="h3-responsive content-style">Earn With Your Car</h3>
                        <h5 class="content-style">Private Vehicle Owners Can Earn Part-Time or Full Time With Our Platform.</h5>
                    </div>
                </div>
                <div class="carousel-item" style="height:500px">
                    <!--Mask color-->
                    <div class="view" style="height:100%">
                        <img class="d-block w-100" src="images/carchoice.jpg" alt="Third slide" style="height:100%">
                        <div class="mask rgba-black-slight"></div>
                    </div>
                    <div class="carousel-caption">
                        <h3 class="h3-responsive content-style">Post Requirements</h3>
                        <h5 class="content-style">Get In Touch With Drivers Based On Your Requirements.</h5>
                    </div>
                </div>
            </div>
            <!--/.Slides-->
            <!--Controls-->
            <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" style="color:black" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!--/.Controls-->
        </div>
        <!--/.Carousel Wrapper-->

    </div>

    <br />
    <div class="row">
        <div class="col-md-6" style="border:1px solid black;border-radius:5px;padding:10px;margin:10px">
            <div style="font-size:20px;font-weight:700"> If you are a <span style="color:cadetblue">Customer</span></div>
            <hr />
            <ul>
                <li><b>Filter a Driver</b> - See the filtered data of Drivers according to your requirements...</li>
                <li><b>Post</b> - If you are new then no worries!!! Create a post according to your requirements and finalize the best deals :)</li>
                <li><b>My Profile</b> - You can view and update your profile any Time...</li>
                <li><b>Rate Driver</b> - Help Drivers to get more ratings...</li>
            </ul>

            <div style="width:100%;text-align:center;font-size:25px">Happy Browsing :)</div>
            
        </div>

        <div class="col-md-5" style="border:1px solid black;border-radius:5px;padding:10px;margin:10px">
             <div style="font-size:20px;font-weight:700"> If you are a <span style="color:cadetblue">Car Holder</span></div>
            <hr />

            <ul>
                <li><b>Post</b> - View all post of customers and grab a chance to earn by commenting on post:)</li>
                <li><b>My Profile</b> - You can view and update your profile any Time...</li>
            </ul>

             <div style="width:100%;text-align:center;font-size:25px">Happy Earning :)</div>
        </div>
    </div>
</asp:Content>
