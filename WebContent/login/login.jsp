<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Protective Paws</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style><%@include file="/css/styles.css"%></style>

</head>
<body class="my-login-page">

<jsp:include page="../common/header.jsp"></jsp:include>
	<section class="h-100" style="margin-top: 40px">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Shelter Sign In</h4>
							<form action="<%=request.getContextPath()%>/login" method="post" class="my-login-validation">
								<div class="form-group">
									<label for="email">Username:</label>
									<input id="username" type="text" class="form-control" name="username" placeholder="username" required
										autofocus>
								</div>

								<div class="form-group">
									<label for="password">Password:
									</label>
									<input id="password" type="password" class="form-control" name="password" placeholder="password" required
										data-eye>
								</div>

								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										Login
									</button>
								</div>
								<div class="mt-4 text-center">
									Don't have an account? <a href="<%= request.getContextPath() %>/register" class="nav-link">Sign up</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	


	
	
	
</body>
</html>