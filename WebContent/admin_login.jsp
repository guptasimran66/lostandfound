<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.util.ArrayList" %>
  <%@ page import="product.Product" %>  
<%@ page import="database.DatabaseQuery" %>    
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
					 	<%
 							if((session.getAttribute("college_id"))!=null)
 							{
							%> 
								<li><a href="Controller2?mode=logout"><i>Log Out</i></a></li>	
				 				<li> hello <%= session.getAttribute("college_id") %> </li>
				 			<% 
							 }
				 			else
							{ 	
							%>
							<li><a href="admin_signup.jsp">Sign Up</a></li>
							<li><a href="admin_login.jsp">Login</a></li>
							<% 
							}
							%>  
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
				<li><a href="Controller?mode=admin_display&status=0"><i>LOST</i></a></li>
				<li><a href="Controller?mode=admin_display&status=1"><i>FOUND</i></a></li>
				<li><a href="admin_approve.jsp"><i>APPROVE</i></a></li>
				<li><a href="admin_archieve.jsp"><i>MOVE TO ARCHIEVE</i></a></li>
			</ul>
		</div> 
	</div>
	<!--  Navigation  -->
	
	<!-- Main -->
	<div>
  <div style="margin: 50px;padding: 0px 400px 50px 400px;">
<form class="form-horizontal" action="Controller2?mode=login" method="post">
  <fieldset>
    <legend><i>Log In..!</i></legend>
    <div class="form-group has-error">
    	  <label class="control-label" for="focusedInput">College_Id</label>
    	  <input type="text" class="form-control" id="inputError" placeholder="College_id" name="college_id" required>
  	</div>
    <div class="form-group has-error">
      <label class="control-label" for="focusedInput">Password</label>
      <input type="password" class="form-control" id="inputError" placeholder="Password" name="password">
    </div>
 <%
		String login_msg=(String)request.getAttribute("error");  
		if(login_msg!=null)
 		{
	%> 
    	<div class="alert alert-dismissible alert-danger">
    	<button type="button" class="close" data-dismiss="alert">Sorry;</button>
    	<strong>Oh snap!</strong> <span class="alert-link"><%= "<font color=white size=4px>"+login_msg+"</font>" %> Try submitting again</span>
  		</div>
    <% 
    	}
    %> 
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
    	 <input type="hidden" name="mode" value="login">
  </fieldset>
</form>
</div>
</div>	
		<div id="copyright" class="container">
			Design: <a href="#">SHUBH</a> Images:(<a href="#">LNMIIT</a>)
		</div>
	</body>
</html>