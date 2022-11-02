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

	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>

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
						<th>Name</th>
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
							<td><c:out value="${supply.supply_name}" /></td>
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
