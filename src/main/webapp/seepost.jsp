<%
	if(session.getAttribute("id")==null || session.getAttribute("title")==null || session.getAttribute("txt")==null || session.getAttribute("iduser")==null){
		response.sendRedirect("index.jsp");
	}
	if(session.getAttribute("email")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign in Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="Posting-content">
					<div class="posting-form" style="padding:60px 30px 60px 30px">
					
						<h2 class="form-title">Post</h2>
						
						<form class="register-form" id="post-form">
							
							<div class="form-group">
								<input disabled type="text" name="title" id="title" value="<%= session.getAttribute("title") %>"/>
							</div>
							
							<div class="form-group">
								<textarea disabled id="txt" name="txt" style= "resize: none; padding: 40px 20px 40px 20px" cols="106" rows="20" aria-labelledby="your-answer-header" ><%=session.getAttribute("txt")%></textarea>
							</div>
						</form>
						<br />
						
						<br />
						<br />
						
						<h2 class="form-title">Replay</h2>
						
						<form class="register-form" id="post-form">
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
									String query ="SELECT * FROM replay where idpost = ?";
									PreparedStatement pst = conn.prepareStatement(query);
									pst.setInt(1, Integer.parseInt(session.getAttribute("id").toString()));
									ResultSet rs = pst.executeQuery();
									RequestDispatcher dispatcher = null;
								%>
					
								<% 	
									while(rs.next()){
								%>
								
								<form class="register-form" id="replay-form">
									<br />
									<br />
									<div class="form-group">
										<textarea disabled id="replay" name="replay" style= "resize: none; padding: 40px 20px 40px 20px" cols="106" rows="20" aria-labelledby="your-answer-header" ><%=rs.getString("replay")%></textarea>
									</div>			
									<br />
								</form>
										
									<br />
									<hr />
									<br />
					
									<% 
									}
									%>
								</form>
									
								<form method="post" action="replay" class="register-form" id="post-form">
							
									<div class="form-group">
										<input type="hidden" name="email" id="email" value="<%= session.getAttribute("email") %>">
									</div>
							
									<div class="form-group">
										<input type="hidden" name="idpost" id="idpost" value="<%= session.getAttribute("id") %>">
									</div>
							
									<div class="form-group">
										<textarea id="rep" name="rep" style= "resize: none; padding: 40px 20px 40px 20px" cols="106" rows="10" aria-labelledby="your-answer-header" placeholder="replay..."></textarea>
									</div>
							
									<div class="form-group form-button">
										<input type="submit" name="posting" id="posting" class="form-submit" value="Post" />
									</div>
							
								</form>
								</div>
							
						<div>
							<a href="index.jsp">
								<button style="background: #DDDDDD; padding: 18px 50px 18px 50px">Home Page</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>