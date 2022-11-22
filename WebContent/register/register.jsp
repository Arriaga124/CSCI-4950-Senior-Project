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
	<section class="h-100" >
	<div class="alert alert-success center" role="alert">
				<p>${NOTIFICATION}</p>
	</div>
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">User Register Form</h4>
							<form action="<%=request.getContextPath()%>/register" method="post" autocomplete="off">
								
								<div class="form-group">
									<label for="uname">First Name:</label>
									<input id="uname" type="text" class="form-control" name="firstName" required autofocus>
								</div>

								<div class="form-group">
									<label for="uname">Last Name:</label>
									<input id="uname" type="text" class="form-control" name="lastName" required autofocus>
								</div>

								<div class="form-group">
									<label for="uname">User Name:</label>
									<input id="username" type="text" class="form-control" name="username" required>
								</div>

								<div class="form-group">
									<label for="password">Password:</label>
									<input id="password" type="password" class="form-control" name="password" required data-eye>
								</div>


								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										Register
									</button>
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