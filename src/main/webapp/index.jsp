<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Freelancer - Start Bootstrap Theme</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>

<body id="page-top">

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
		<div class="container">
		
			<a class="navbar-brand" href="#page-top">Itested</a>
			
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
				
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="post.jsp">Post</a>
					</li>
					
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="mypost.jsp">My Posts</a>
					</li>
					
					<li class="nav-item mx-0 mx-lg-1">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a>
					</li>
					
					<li class="nav-item mx-0 mx-lg-1 bg-danger">
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="#"><%=session.getAttribute("name") %></a>
					</li>
					
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- Posts-->
	
	<article class="page-section" id="contact" style="margin-top: 100px;">
		<div class="container">
			<!-- Posts Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Posts</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Posts Section-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">

					<%@page import="java.sql.DriverManager"%>
					<%@page import="java.sql.ResultSet"%>
					<%@page import="java.sql.Statement"%>
					<%@page import="java.sql.Connection"%>
					<%@page import="ContextDb.ConnexionDB" %>
					<%@page import="java.sql.PreparedStatement" %>
					<%@page import="jakarta.servlet.RequestDispatcher" %>
					<%@page import="jakarta.servlet.RequestDispatcher" %>
	
					<%
						Connection conn;
						conn = ConnexionDB.getConnexion();
						String query ="SELECT * FROM posts";
						PreparedStatement pst = conn.prepareStatement(query);
						ResultSet rs = pst.executeQuery();
						RequestDispatcher dispatcher = null;
					%>
					
					<% 	
						while(rs.next()){
					%>
					<form id="contactForm" data-sb-form-api-token="API_TOKEN" method="post" action="seepost">
					<div class="form-floating mb-3">
							<div style="background-color: #ffffff; width: 100%; border: none; text-align: left; padding: 3px 12px 3px 12px">
								<label for="title" style="display: inline-block; color: #050505"><%=rs.getString("title") %></label>
								<br />
								<br />
								<label for="txt" style="display: inline-block;">
									<%
										if (rs.getString("txt").length()<=100) {
									%>
									<%=rs.getString("txt").substring(0,rs.getString("txt").length()) %>
									<%} else { %>
									<%=rs.getString("txt").substring(0,100) + "..." %>
									<%}
									  int a = rs.getInt("id");
									%>
								</label>
								<br />
								<input type="hidden" name="idpost" value="<%= a %>"/>
							</div>
							<input type="submit" value="See Post >>" name="seepost" class="form-submit" style="background: #DDDDDD; padding: 18px 50px 18px 50px">
					</div>
					</form>
					<br />
					<hr />
					<br />
					
					<% 
					}
					%>
				</div>
			</div>
		</div>
	</article>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	
</body>
</html>
