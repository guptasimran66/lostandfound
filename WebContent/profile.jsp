<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.User" %>  
<%@ page import="database.DatabaseQuery1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	<head>
		<title>LOST 'N' FOUND PORTAL, LNMIIT</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="css/bootstrap_min.css" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:700italic,400,300,700' rel='stylesheet' type='text/css'>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
	</head>

	<body class="homepage">

	<!-- Header -->
		<div id="header">
			<div class="container">
					
				<!-- Logo -->
					<div id="logo">
						<h4><a href="#">LOST 'n' FOUND</a></h4>
					</div>
				
				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li class="active"><a href="index.jsp">Home</a></li>
					 	<%
 							if((session.getAttribute("college_id"))!=null)
 							{
							%> 
								<li><a href="profile.jsp"><i>My Profile</i></a></li>
								<li><a href="logout.jsp"><i>Log Out</i></a></li>	
				 			<% 
							 }
				 			else
							{
							%>
							<li><a href="signup.jsp">Sign Up</a></li>
							<li><a href="login.jsp">Login</a></li>
							<% 
							}
							%>  
							<li><a href="about.jsp">About Us</a></li>
						</ul>
					</nav>
			</div>
		</div>
	<!-- Header -->
		
	<!-- Banner -->
		<div id="banner">
			<div class="container">
			</div>
		</div>
	<!-- /Banner -->
	
	<!--  Navigation  -->
	<div class="menu">
		<div class="menu_list">
			<ul class="main-menu">
				<li><a href="Controller?mode=display&status=0"><i>LOST</i></a></li>
				<li><a href="Controller?mode=display&status=1"><i>FOUND</i></a></li>
				<li><a href="entry_product.jsp"><i>SUBMIT</i></a></li>
				<li><a href="Instruction.jsp"><i>Instructions</i></a></li>
			<%-- <%
 				if()
 				{
				%> 
					<li><a href="?mode=My_Submissions"><i>My Submissions</i></a></li>	
				 <% 
				 }
				 %> --%>	
			</ul>
		</div>
 		<div class="menu_search"> 			
      		<form class="navbar-form navbar-left" role="search">
        	<div class="form-group">
          		<input type="text" class="form-control" placeholder="Search">
        	</div>
        		<button type="submit" class="btn btn-default"><i class="fa fa-search" style="font-size:25px;"></i></button>
      		</form>
		</div> 
	</div>
	<!--  Navigation  -->

	<!-- Main -->

  <div style="margin: 50px;padding: 0px 300px 50px 300px;">
<% ArrayList<User> User_info = DatabaseQuery1.getUpdate((String)session.getAttribute("college_id")); %>
  <form class="form-horizontal"action="Controller1?mode=editUser" method="post">
  <fieldset>
    <legend>First Time Users</legend>
    <div class="form-group has-success">
      <label class="control-label" for="inputSuccess">College_Id</label>
      <input type="text" class="form-control" id="inputSuccess" placeholder="<%= User_info.get(0).getCollege_id() %>" name="college_id" required>
  </div>
    <div class="form-group has-success">
      <label class="control-label" for="inputSuccess">Full Name</label>
      <input type="text" class="form-control" id="inputSuccess" placeholder="<%= User_info.get(0).getName() %>" name="name" required>
  </div>	
    <div class="form-group has-success">
      <label class="control-label" for="inputSuccess">Email</label>
      <input type="email" class="form-control" id="inputSuccess" placeholder="<%= User_info.get(0).getEmailid() %>" name="email" required>
  </div>
  
    <div class="form-group">
      <label class="control-label" for="inputSuccess">Batch</label>
        <select class="form-control" id="select" name="batch" >
          <option value="first" >Y15</option>
          <option value="second" >Y14</option>
          <option value="third" >Y13</option>
          <option value="fourth" >Y12</option>
        </select>
    </div>

    <div class="form-group has-success">
      <label class="control-label" for="inputSuccess">Contact Number</label>
      <input type="text" class="form-control" id="inputSuccess" placeholder="<%= User_info.get(0).getContactno() %>" name="number" required>
  </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Create Account</button>
      </div>
    </div>
<!--     <input type="hidden" name="mode" value="signup"> -->
  </fieldset>
</form>
</div>	
		<div id="copyright" class="container">
			Design: <a href="#">SHUBH</a> Images:(<a href="#">LNMIIT</a>)
		</div>
	</body>
</html>