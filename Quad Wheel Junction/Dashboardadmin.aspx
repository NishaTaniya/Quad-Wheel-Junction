<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Dashboardadmin.aspx.cs" Inherits="Quad_Wheel_Junction.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Carousel wrapper -->

    <div style="clear:both"></div>
<div
  id="carouselMultiItemExample"
  class="carousel slide carousel-dark text-center"
  data-mdb-ride="carousel"
>
  <!-- Controls -->

  <!-- Inner -->
  <div class="carousel-inner py-4">
    <!-- Single item -->
    <div class="carousel-item active">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="card">
              <img
                src="../images/carimage.jpg"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">CAR Details</h5>
                <p class="card-text">
                  A Perfect Place To Find Private Cars.<pre>
                  </pre>
                </p>
                <a href="car.aspx" class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 d-none d-lg-block">
            <div class="card">
              <img
                src="../images/carrent.jpg"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Customer Details</h5>
                <p class="card-text">
                  Get In Touch With Drivers Based On Your Requirements.
                </p>
                <a href="Customer.aspx" class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 d-none d-lg-block">
            <div class="card">
              <img
                src="../images/carchoice.jpg"
                class="card-img-top"
                alt="..."
              />
              <div class="card-body">
                <h5 class="card-title">Driver Details</h5>
                <p class="card-text">
                  Private Vehicle Owners Can Earn Part-Time or Full Time With Our Platform.
                </p>
                <a href="Driver.aspx" class="btn btn-primary">Button</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

   
  <!-- Inner -->
</div>
    </div>
<!-- Carousel wrapper -->
</asp:Content>
