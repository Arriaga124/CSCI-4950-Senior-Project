<%@ page language = "java" contentType = "text/html; charset = UTF-8"
	pageEncoding = "UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<html>

<head>

<title>Protective Paws</title>

<link rel = "stylesheet"
	href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity = "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin = "anonymous">

</head>

<body>

	<header>
	
		<nav class = "navbar navbar-expand-md navbar-dark" style = "background-color: rgb(34,93,196) ">
			
			<div>
			
				<a class = "navbar-brand"> Protective Paws</a>
				
			</div>

			<ul class = "navbar-nav">
				<li><a href = "<%=request.getContextPath()%>/list"
					class = "nav-link">Animals</a></li>
			</ul>
			
			<ul class = "navbar-nav">
				<li><a href = "<%=request.getContextPath()%>/supply-list"
					class = "nav-link">Supplies</a></li>
			</ul>
			
			<ul class = "navbar-nav">
				<li><a href = "<%=request.getContextPath()%>/staff-list"
					class="nav-link">Staff</a></li>
			</ul>

			<ul class = "navbar-nav navbar-collapse justify-content-end">
				<li><a href = "<%=request.getContextPath()%>/logout"
					class = "nav-link">Logout</a></li>
			</ul>
			
		</nav>
		
	</header>

	<div class = "row">
		

		<div class = "container">
		
			<h3 class = "text-center">Staff and Volunteers</h3>
			<hr>
			<br>
			<h3>Staff and Volunteers</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Position</th>
						<th>Time</th>
						<th>Phone</th>
						<th>Options</th>
					</tr>
					
				</thead>
				
				<tbody>
					<c:forEach var = "staff" items = "${listStaff}">

						<tr>
							<td><c:out value="${staff.id}" /></td>
							<td><c:out value="${staff.name}" /></td>
							<td><c:out value="${staff.position}" /></td>
							<td><c:out value="${staff.time} Hour(s)" /></td>
							<td><c:out value="${staff.phone}" /></td>

							<td><a href="editStaff?id=<c:out value='${staff.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteStaff?id=<c:out value='${staff.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			<div class = "container text-left">

				<a href = "<%=request.getContextPath()%>/newStaff" class = "btn btn-success">Add Staff</a>
			</div>
			
			<br>
			<br>
			<br>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
