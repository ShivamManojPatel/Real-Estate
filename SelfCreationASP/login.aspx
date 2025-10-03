<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SelfCreationASP.login" %>
<%
    HttpCookie myCookie = Request.Cookies["remme"];
            if(myCookie != null)
            {
                Lid.Text = myCookie.Values["Username"];
                Lpass.Text = myCookie.Values["Password"];
            }    
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RealEstate</title>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    
    <!-- css links start -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="Login/fonts/icomoon/style.css"/>
    <link rel="stylesheet" href="Login/css/owl.carousel.min.css"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="Login/css/bootstrap.min.css"/>
    <!-- Style -->
    <link rel="stylesheet" href="Login/css/style.css"/>
    <!-- System Logo -->
    <link rel="shortout icon" type="image/x-icon" href="img/favicon.png"/>
    <!-- css link end -->
</head>
<body>
   <header id="slider-area" style='padding-top: 10px;'>     
        <a href="index.aspx"><img src="Login/images/homebtn.png" alt="Image" width="50px" height="30px" style="padding-left : 20px"></a>          
    </header>  

    <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img src="Login/images/login-bg.png" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
              <h3>LOGIN</h3>
              <!-- <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p> -->
            </div>
            <form method="post" action='' runat="server" id="LoginForm">
              <div class="form-group first">
                  <asp:textbox id="Lid" text="" placeholder="Email" runat="server" class="form-control"/> 
               </div>
              <div class="form-group last mb-4">
                <asp:textbox id="Lpass" text="" placeholder="Password" runat="server" class="form-control"/> 
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                    <asp:CheckBox ID="chbox" runat="server" Text="" value="remember"/>  
                  <div class="control__indicator"></div>
                </label>
              </div>
                <asp:Button ID="Lbtn" runat="server" Text="Login" class="btn btn-block btn-primary" OnClick="Lbtn_Click"/>  
              <span class="d-block text-left my-4 text-muted"><a href="register.aspx"> Didn't Register Yet? </a></span>
            </form>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

    <script src="Login/js/jquery-3.3.1.min.js"></script>
    <script src="Login/js/popper.min.js"></script>
    <script src="Login/js/bootstrap.min.js"></script>
    <script src="Login/js/main.js"></script>
</body>
</html>
