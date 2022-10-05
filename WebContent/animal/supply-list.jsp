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
	
			<h3 class = "text-center">Supplies</h3>
			<hr>
			<br>
			<h3>Supplies</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Type</th>
						<th>Animal</th>
						<th>Amount</th>
						<th>Options</th>
					</tr>
					
				</thead>
				<tbody>
					<c:forEach var = "supply" items = "${listSupply}">

						<tr>
							<td><c:out value="${supply.id}" /></td>
							<td><c:out value="${supply.type}" /></td>
							<td><c:out value="${supply.animal}" /></td>
							<td><c:out value="${supply.amount}" /></td>

							<td><a href="editSupply?id=<c:out value='${supply.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteSupply?id=<c:out value='${supply.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">

				<a href = "<%=request.getContextPath()%>/newSupply" class = "btn btn-success">Add Supplies</a>
			</div>
			
			<br>
			<br>
			<br>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
