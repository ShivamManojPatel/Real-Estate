<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SelfCreationASP.index" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %> 
<%@ Import Namespace="System.Configuration" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RealEstate</title>

    <meta charset="UTF-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

 	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css"/>
  	<link rel="stylesheet" href="assets/style.css"/>
  	<script src="assets/bootstrap/js/jquery-1.9.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.js"></script>
  	<script src="assets/script.js"></script>


	<!-- Owl stylesheet -->
	<link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css"/>
	<link rel="stylesheet" href="assets/owl-carousel/owl.theme.css"/>
	<script src="assets/owl-carousel/owl.carousel.js"></script>
	<!-- Owl stylesheet -->


	<!-- slitslider -->
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/custom.css"/>
    <script type="text/javascript" src="assets/slitslider/js/modernizr.custom.79639.js"></script>
    <script type="text/javascript" src="assets/slitslider/js/jquery.ba-cond.min.js"></script>
    <script type="text/javascript" src="assets/slitslider/js/jquery.slitslider.js"></script>
	<!-- slitslider -->
	
	<style>
		.btnlog{
		    margin: 10px;
		    font-size: 20px;
		    width: 90px;
		    height: 45px;
		    padding: 5px;
		    background: #0055ff;
		    color: #fff;
		    outline: none;
		    border-radius: 4px;
		    border: 1px solid transparent;
		    transition: 0.5s;
		}
		.btnlog:hover {
		    background: #0055dd;
		    color: #fff;
		    transition: 0.5s;
		}
		.btnlog:focus {
		    box-shadow: 0 0 0 5px rgba(0, 85, 255, 0.5)
		}
	</style>
</head>
<body>
        <div class="navbar-wrapper">
		<div class="navbar-inverse" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
		                <span class="sr-only">Toggle navigation</span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>		
		                <span class="icon-bar"></span>
              		</button>
				</div>
				<!-- Nav Starts -->
	            <div class="navbar-collapse collapse">
	              <ul class="nav navbar-nav navbar-right">
	               <li class="active"><a href="index.aspx">Home</a></li>
	                <li><a href="#">About</a></li>
	                <li><a href="#">Contact</a></li>
	              </ul>
	            </div>
	            <!-- #Nav Ends -->
			</div>
		</div>
	</div>
	<div class="container">
        <%
            if (Session["UserId"] == null)
            {
        %>
		<!-- Header Starts -->
				<div class="header">
					<a href="index.jsp"><img src="images/logo.png" alt="Realestate"/></a>
				              <ul class="pull-right">
				                <li><a href="login.aspx">Login</a></li>
				                <li><a href="register.aspx">Register</a></li>         
				              </ul>
				</div>
        <%
            }
            else
            {
        %>
            <div class="header">
					<a href="index.jsp"><img src="images/logo.png" alt="Realestate"/></a>
				              <ul class="pull-right">
				                <li><a href="Dashboard.aspx">Dashboard</a></li>
				                <li><a href="logout.aspx">logout</a></li>         
				              </ul>
				</div>
        <%
            }
        %>
	</div>
	
	<!-- body -->
	<div class="">
        <!-- -->
        <div id="slider" class="sl-slider-wrapper">
        <div class="sl-slider">
          <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
            <div class="sl-slide-inner">
              <div class="bg-img bg-img-1"></div>
              <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
              <blockquote>              
              <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
              <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
              <cite>$ 20,000,000</cite>
              </blockquote>
            </div>
          </div>
          <!-- -->  
          <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
            <div class="sl-slide-inner">
              <div class="bg-img bg-img-2"></div>
              <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
              <blockquote>              
              <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
              <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
              <cite>$ 20,000,000</cite>
              </blockquote>
            </div>
          </div>
          <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
            <div class="sl-slide-inner">
              <div class="bg-img bg-img-3"></div>
              <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
              <blockquote>              
              <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
              <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
              <cite>$ 20,000,000</cite>
              </blockquote>
            </div>
          </div>
          <div class="sl-slide" data-orientation="vertical" data-slice1-rotation="-5" data-slice2-rotation="25" data-slice1-scale="2" data-slice2-scale="1">
            <div class="sl-slide-inner">
              <div class="bg-img bg-img-4"></div>
              <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
              <blockquote>              
              <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
              <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
              <cite>$ 20,000,000</cite>
              </blockquote>
            </div>
          </div>
          <div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1">
            <div class="sl-slide-inner">
              <div class="bg-img bg-img-5"></div>
              <h2><a href="#">2 Bed Rooms and 1 Dinning Room Aparment on Sale</a></h2>
              <blockquote>              
              <p class="location"><span class="glyphicon glyphicon-map-marker"></span> 1890 Syndey, Australia</p>
              <p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p>
              <cite>$ 20,000,000</cite>
              </blockquote>
            </div>
          </div>
        </div><!-- /sl-slider -->
        <nav id="nav-dots" class="nav-dots">
          <span class="nav-dot-current"></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </nav>
      </div><!-- /slider-wrapper -->
	</div>
	<div class="container">
        <div class="properties-listing spacer">
        <h2>Featured Properties</h2>
        <div id="owl-example" class="owl-carousel">
            <!-- -->
            <%
                MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=root;database=realestate");
                con.Open();
                MySqlCommand cmd = new MySqlCommand("select * from house_details", con);
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
            %>
	            <div class="properties">
	                <div class="image-holder"><a href='<%Response.Write(dr.GetValue(10).ToString()); %>'><img src="<%Response.Write(dr.GetValue(10).ToString()); %>" class="img-responsive" alt="properties"/></a>
	          	         <% if (dr.GetValue(11).ToString().Equals("Sold"))
                            {
                                Response.Write("<div class='status sold'>Sold</div>");
                            }
                            else if (dr.GetValue(11).ToString().Equals("On Sell"))
                            {
                                Response.Write("<div class='status new'>On Sell</div>");
                            }
                        %>
	                </div>
	                <center><h4><a href="x"><%Response.Write(dr.GetValue(1).ToString()); %></a></h4>
	                <p class="price">Price: <%Response.Write(dr.GetValue(9).ToString()); %></p>
	                <div class="listing-detail"><span data-toggle="tooltip" data-placement="bottom" data-original-title="Bed Room"><% Response.Write(dr.GetValue(7).ToString()); %></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Wash Room"><% Response.Write(dr.GetValue(8).ToString());%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Living Room"><%Response.Write(dr.GetValue(6).ToString());%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Parking"><% Response.Write(dr.GetValue(5).ToString());%></span> <span data-toggle="tooltip" data-placement="bottom" data-original-title="Kitchen"><% Response.Write(dr.GetValue(4).ToString());%></span> </div></center>
                    
                    <% if (dr.GetValue(11).ToString().Equals("Sold"))
                            {
                                Response.Write("<a class='btn btn-primary' disabled>Book Meeting</a>");
                            }
                            else
                            {
                                    %>
                                <a class='btn btn-primary' href='
                                    <%
                                    if(Session["UserId"] != null)
                                    {
                                        %>
                                        Bookappoinment.aspx?id=<% Response.Write(dr.GetValue(0).ToString()); %>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        login.aspx
                                        <%
                                    }
                                    %>
                                    '>Book Meeting</a>
                                    <%
                            }
                        %>
                </div>
            <%
                }
            %>
	        <!--  -->
        </div>
        </div>
    </div>




<div class="footer">

<div class="container">



<div class="row">
            <div class="col-lg-3 col-sm-3">
                   <h4>Information</h4>
                   <ul class="row">
                <li class="col-lg-12 col-sm-12 col-xs-3"><a href="about.php">About</a></li>
                <li class="col-lg-12 col-sm-12 col-xs-3"><a href="agents.php">Agents</a></li>         
                <li class="col-lg-12 col-sm-12 col-xs-3"><a href="blog.php">Blog</a></li>
                <li class="col-lg-12 col-sm-12 col-xs-3"><a href="contact.php">Contact</a></li>
              </ul>
            </div>
            
            <div class="col-lg-3 col-sm-3">
                    <h4>Newsletter</h4>
                    <p>Get notified about the latest properties in our marketplace.</p>
                    <form class="form-inline" role="form">
                            <input type="text" placeholder="Enter Your email address" class="form-control">
                                <button class="btn btn-success" type="button">Notify Me!</button>
                    </form>
            </div>
            
            <div class="col-lg-3 col-sm-3">
                    <h4>Follow us</h4>
                    <a href="#"><img src="images/facebook.png" alt="facebook"></a>
                    <a href="#"><img src="images/twitter.png" alt="twitter"></a>
                    <a href="#"><img src="images/linkedin.png" alt="linkedin"></a>
                    <a href="#"><img src="images/instagram.png" alt="instagram"></a>
            </div>

             <div class="col-lg-3 col-sm-3">
                    <h4>Contact us</h4>
                    <p><b>Bootstrap Realestate Inc.</b><br>
<span class="glyphicon glyphicon-map-marker"></span> 8290 Walk Street, Australia <br>
<span class="glyphicon glyphicon-envelope"></span> hello@bootstrapreal.com<br>
<span class="glyphicon glyphicon-earphone"></span> (123) 456-7890</p>
            </div>
        </div>
<p class="copyright">Copyright 2013. All rights reserved.	</p>


</div></div>

</body>
</html>
