<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SelfCreationASP.Register" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- css links start -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Login/fonts/icomoon/style.css">
    <link rel="stylesheet" href="Login/css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="Login/css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="Login/css/style.css">
    <!-- System Logo -->
    <link rel="shortout icon" type="image/x-icon" href="img/favicon.png"/>
	<!-- css links end -->
    <title>#Events-Registration</title>
  </head>
  <body>
  <!-- header start -->
  	<header id="slider-area" style='padding-top: 10px;'>      
        <a href="index.aspx"><img src="Login/images/homebtn.png" alt="Image" width="50px" height="30px" style="padding-left : 20px"></a>          
    </header> 
  <!-- header end -->
  
  <!-- body start -->
  	<div class="content">
    <div class="container">
      <div class="row">
        
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-10">
              <div class="mb-4">
              <h3>REGISTRATION</h3>
              <!-- <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p> -->
            </div>
            <form method="post" runat="server" id="RegistrationForm">
                <div class="form-group first">
                    <asp:textbox id="fname" placeholder="First Name" runat="server" class="form-control"/>
                </div>
                <div class="form-group first">
                    <asp:textbox id="lname" placeholder="Last Name" runat="server" class="form-control"/>
                </div>
                <div class="form-group first">
                    <asp:textbox id="remail" placeholder="Email" runat="server" class="form-control"/>
                </div>
                <div class="form-group first">
                    <asp:textbox id="cno" placeholder="Contact Name" runat="server" class="form-control"/>
                </div>
                <div class="form-group first">
                    <asp:dropdownlist id="Gender" runat="server" CssClass="form-control" style="background-color: inherit;">
                        <asp:listitem selected="true" disabled>Gender</asp:listitem>
                        <asp:listitem value="Male">Male</asp:listitem>
                        <asp:listitem value="Female">Female</asp:listitem>
                        <asp:listitem value="Others">Others</asp:listitem>
                    </asp:dropdownlist>
                </div>
                <div class="form-group first">
                    <asp:textbox id="pass" text="" placeholder="Password" runat="server" class="form-control" textmode="Password"/> 
                </div>
                <div class="form-group last mb-4">
                    <asp:textbox id="cpass" text="" placeholder="Confirm Password" runat="server" class="form-control" textmode="Password"/> 
                </div>
                <asp:Button ID="Rbtn" runat="server" Text="Register" class="btn btn-block btn-primary" OnClick="Rbtn_Click"/>
              <span class="d-block text-left my-4 text-muted"><a href="login.aspx"> Already have an Account? </a></span>
            </form>
            </div>
          </div>      
        </div>
        <div class="col-md-6" style='top: 150px;'>
          <img src="Login/images/registration-bg.svg" alt="Image" class="img-fluid" style="">
        </div>
      </div>
    </div>
  </div>
  <!-- body ends -->
  
  <!-- script addons start -->
  	<script src="Login/js/jquery-3.3.1.min.js"></script>
    <script src="Login/js/popper.min.js"></script>
    <script src="Login/js/bootstrap.min.js"></script>
    <script src="Login/js/main.js"></script>
  <!-- script addons end -->
</body>
</html>
