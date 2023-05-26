<%
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
						
						<form method="post" action="post" class="register-form" id="post-form">
							
							<div class="form-group">
								<input type="hidden" name="email" id="email" value="<%= session.getAttribute("email") %>">
							</div>
							
							<div class="form-group">
								<input type="text" name="title" id="title" placeholder="Title" />
							</div>
							
							<div class="form-group">
								<textarea id="txt" name="txt" style= "resize: none; padding: 40px 20px 40px 20px" cols="106" rows="20" aria-labelledby="your-answer-header" placeholder="Post..."></textarea>
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="posting" id="posting"
									class="form-submit" value="Post" />
							</div>
							
						</form>
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