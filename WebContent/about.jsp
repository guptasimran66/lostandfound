<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<script>
	var interval;
	function start_ticker(){
		$("#ticker_ul li:first").slideUp(function(){
		$(this).appendTo($("#ticker_ul")).slideDown();
		});
		}
			   		
	function stop_ticker(){
		clearInterval(interval);
		}
		$(document).ready(function(){
		interval = setInterval(start_ticker,1000);
		$('#ticker_ul').hover(function(){
			stop_ticker();
		},function (){
			interval = setInterval(start_ticker,1000);
			});
   		});	
	</script>

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
	<div>
<div class="about1">
	<div style="margin: 0px 50px 10px 0px;padding: 20px 200px 0px 300px;">
		<h3><i>About Us:</i></h3>			
			<div class="about">
				<h3 class="">Developed By..:</h3>
				Second Year Students<br/>
				Department of Computer Science & Engineering<br/><br/>
				<h3 class="">Contact for any Queries:</h3>
				<a href="https://www.facebook.com/shubham.sharma11" target="_blank"><i class="fa fa-facebook-square" style="font-size:36px"></i>shubh</a><br/>
				<a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook-square" style="font-size:36px"></i>simram</a><br/>
				<a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook-square" style="font-size:36px"></i>somya</a><br/>
				<a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook-square" style="font-size:36px"></i>sonali</a><br/>	
			</div>
	</div>
</div>
</div>	
		<div id="copyright" class="container">
			Design: <a href="#">SHUBH</a> Images:(<a href="#">LNMIIT</a>)
		</div>
	</body>
</html>