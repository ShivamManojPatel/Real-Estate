<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="meeting.aspx.cs" Inherits="SelfCreationASP.meeting" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %> 
<%@ Import Namespace="System.Configuration" %>
<%
    MySqlConnection con = new MySqlConnection("server=127.0.0.1;user id=root;database=realestate");
    con.Open();
    String query = "select Registration_Id from registration_master where Email='"+Session["UserId"].ToString()+"'";
	MySqlCommand cmd = new MySqlCommand(query, con);
	MySqlDataReader dr = cmd.ExecuteReader();
	String id = null;
	while (dr.Read())
	{
		id = dr.GetValue(0).ToString();
	}
	dr.Close();
%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

 	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" />
  	<link rel="stylesheet" href="assets/style.css"/>
  	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.js"></script>
  	<script src="assets/script.js"></script>



	<!-- Owl stylesheet -->
	<link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">
	<link rel="stylesheet" href="assets/owl-carousel/owl.theme.css">
	<script src="assets/owl-carousel/owl.carousel.js"></script>
	<!-- Owl stylesheet -->


	<!-- slitslider -->
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/style.css" />
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/custom.css" />
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
            th{
                position: sticky;
                top: 0px;
            }

            .table-wrapper{
                max-height: 800px;
                overflow-y: scroll;
            }

            .thback{
                background-color: white;
            }
        </style>
	</style>
<title>Meetings</title>
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
	               <li><a href="Dashboard.aspx">Buy</a></li>
	                <li><a href="sell.aspx">Sell</a></li>
	                <li class="active"><a href="meeting.aspx">Meetings</a></li>
	              </ul>
	            </div>
	            <!-- #Nav Ends -->
			</div>
		</div>
	</div>
	<div class="container">
				<div class="header">
					<a href="index.jsp"><img src="images/logo.png" alt="Realestate"></a>
				              <ul class="pull-right">
				                <li><a href="Dashboard.aspx">back</a></li>
				                <li><a href="logout.aspx">logout</a></li>         
				              </ul>
				</div>
	</div>
	<hr>
<!-- body -->
	<center><h3>Your Meeting</h3></center>
	<table class="table table-borderless table-wrapper">
		<thead>
                                                    <th style="background-color: white;">Meeting With</th>
                                                    <th style="background-color: white;">Meeting Date</th>
                                                    <th style="background-color: white;">Meeting Time</th>
                                                    <th style="background-color: white;">Meeting Address</th>
                                                    <th style="background-color: white;">House Name</th>
                                                    <th style="background-color: white;">Edit</th>
                                                    <th style="background-color: white;">Cancel</th>
                                                </thead>
		<tbody>
			<%
                String queryx = "select meetings.Meeting_id, registration_master.First_Name, registration_master.Last_Name, meetings.Meeting_date, meetings.Meeting_time, meetings.Meeting_venue, house_details.House_Name from meetings inner join registration_master on meetings.Meeting_with = registration_master.Registration_Id inner join house_details on meetings.HouseId = house_details.HouseId where meetings.Meeting_from='"+id+"' and meetings.Status='Upcoming'";
                cmd = new MySqlCommand(queryx, con);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
			%>
				<tr>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(1).ToString() + dr.GetValue(2).ToString()); %></td>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(3).ToString()); %></td>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(4).ToString()); %></td>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(5).ToString()); %></td>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(6).ToString()); %></td>
					<td style="background-color: white;"><a class='btn btn-warning' href='editappoinment.aspx?id=<% Response.Write(dr.GetValue(0).ToString()); %>'>Edit</a></td>
					<td style="background-color: white;"><a class="btn btn-danger" href="cancel.aspx?id=<% Response.Write(dr.GetValue(0).ToString());%> ">Cancel</a></td>
				</tr>
			<%
                }
				dr.Close();
			%>
		</tbody>
	</table>
	<hr>
	<center><h3>Meeting</h3></center>
	<table class="table table-borderless table-wrapper">
		<thead>
                                                    <th style="background-color: white;">Meeting With</th>
                                                    <th style="background-color: white;">Meeting Date</th>
                                                    <th style="background-color: white;">Meeting Time</th>
                                                    <th style="background-color: white;">Meeting Address</th>
                                                    <th style="background-color: white;">House Name</th>
                                                    <th style="background-color: white;">Cancel</th>
                                                </thead>
		<tbody>
			<%
				String queryy = "select meetings.Meeting_id, registration_master.First_Name, registration_master.Last_Name, meetings.Meeting_date, meetings.Meeting_time, meetings.Meeting_venue, house_details.House_Name from meetings inner join registration_master on meetings.Meeting_from = registration_master.Registration_Id inner join house_details on meetings.HouseId = house_details.HouseId where meetings.Meeting_with='"+id+"' and meetings.Status='Upcoming'";               
				cmd = new MySqlCommand(queryy, con);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
			%>
				<tr>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(1).ToString() + dr.GetValue(2).ToString()); %></td>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(3).ToString()); %></td>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(4).ToString()); %></td>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(5).ToString()); %></td>
					<td style="background-color: white;"><% Response.Write(dr.GetValue(6).ToString()); %></td>
					<td style="background-color: white;"><a class="btn btn-danger" href="cancel.aspx?id=<% Response.Write(dr.GetValue(0).ToString());%> ">Cancel</a></td>
				</tr>
			<%
                }
				dr.Close();
			%>
		</tbody>
	</table>
<!-- body over -->
	
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
                                <button class="btn btn-success" type="button">Notify Me!</button></form>
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
