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
<div class="post-content">
		<h2 style="margin-bottom: 1.1em;">First Time Users</h2>
		<p><span>Register</span> » <span>Login</span> » <span>Profile</span> » <span>Submit</span></p>
		<h2>General Instructions</h2>
		<ul>
			<li><strong>Editing the Post</strong>
			<ul>
				<li>You can edit your post to rectify any mistake</li>
			</ul>
			</li>
			<li><strong>Using Tags</strong>
			
			<ul>
				<li>Tags are used to group similar items together</li>
				<li>We <del>don’t</del> can’t cover whole variety of products</li>
				<li>Use generic terms in tags.</li>
			</ul>
			</li>
		</ul>
		<table style="width: 40%; margin-left: 3.5em; table-layout: fixed; height: 140px; border: 1px dashed; margin-left: 35%;">
		<tbody>
			<tr>
			<td style="text-align: center;"><strong>DON&#8217;Ts</strong></td>
			<td style="text-align: center;"><strong>DOs</strong></td>
			</tr>
			
			<tr>
			<td style="text-align: center;">Nokia 3310</td>
			<td style="text-align: center;">Mobile</td>
			</tr>
			
			<tr>
			<td style="text-align: center;">Gone with the Wind</td>
			<td style="text-align: center;">Book</td>
			</tr>
		</tbody>
		</table>
		
		<ul>
			<li><strong>Image Upload</strong>
			<ul>
				<li>Use an optimal resolution for image</li>
				<li>Show the details clearly</li>
			</ul>
			</li>
		</ul>

		<h2>Lost Item</h2>
		<ul>
			<li>Fill in your item details</li>
			<li>Upload an image (Generic Image)</li>
		</ul>
		
		<h2>Found Item</h2>
		<ul>
			<li>Fil in item details</li>
			<li>Upload an image (Clicked Pic)</li>
			<li><strong>Recommendation</strong> : Submit the item in Security Office</li>
			<li>We respect you. You don’t buy treat, and you earn it..!</li>
		</ul>

		<h2>Queries or Doubts</h2>
		<ul>
			<li>Drop a mail : <a href="">ph242810sharma@gmail.com</a></li>
			<li>Ping me: <a href="https://www.facebook.com/shubham.sharma11">FaceBook</a></li>
		<li><del>Call me</del> Realistic Emergency : (+91) 9999999999</li>
		</ul>				            			                        
	</div>
</div>	
		<div id="copyright" class="container">
			Design: <a href="#">SHUBH</a> Images:(<a href="#">LNMIIT</a>)
		</div>
	</body>
</html>	