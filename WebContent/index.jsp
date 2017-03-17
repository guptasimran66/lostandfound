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
								<li><a href="Controller1?mode=logout"><i>Log Out</i></a></li>	
				 				<li> hello <%= session.getAttribute("college_id") %> </li>
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
      		<form class="navbar-form navbar-left" role="search" action="Controller?mode=search" method="post">
        	<div class="form-group">
          		<input type="text" class="form-control" placeholder="Search" name="search">
        	</div>
        		<button type="submit" class="btn btn-default"><i class="fa fa-search" style="font-size:25px;"></i></button>
      		</form>
		</div> 
	</div>
	<!--  Navigation  -->

	<!-- Main -->
	<div>
<div id="page">
			<div class="post">			
				<div class="post-header">					
					<h2>Home</h2>    				    
				</div>				   				        			        	          
				
				<div class="post-content1">			                                        
				<ul>
					<li>To reduce regular load of mails</li>
					<li>Provide better medium for conveying  information</li>
					<li>Each query concerns only two beings, not the whole planet</li>
				</ul>
				<h3>Aims</h3>
				<ul>
					<li>Reserve web-mail for important information</li>
				</ul>
				<p>If <strong>EVERYBODY</strong> have some problem,</p>
				<p>you have time &amp; skill to solve it.</p>
				<p>Then don&#8217;t wait for others,</p>
				<p>to solve it for <strong>YOU</strong>.</p>
				</div>
			</div>											
 		<%  ArrayList<Product> ProductList = DatabaseQuery.recent(); %>
					<div class="ticker">
						<section class="sidebar">
							<header>
								<h2><i>RECENTLY ADDED</i></h2>
							</header>
							<ul class="style2" id="ticker_ul">
								<% for(Product Plist : ProductList) {%>
								<li><a href="#"><%= Plist.getDescription() %></a></li>
								<% } %>
								<!-- <li><a href="#">ITEM 2</a></li>
								<li><a href="#">ITEM 3</a></li>
								<li><a href="#">ITEM 4</a></li>
								<li><a href="#">ITEM 5</a></li> -->
							</ul>
						</section>
					</div>
			</div>
	</div>	
		<div id="copyright" class="container">
			Design: <a href="#">SHUBH</a> Images:(<a href="#">LNMIIT</a>)
		</div>
	</body>
</html>