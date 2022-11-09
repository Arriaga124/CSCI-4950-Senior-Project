<%
	if (session.getAttribute("name")==null){
		response.sendRedirect("login/login.jsp");
	}
%>


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
	
<!--//Dog/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	
		<div class = "row">
			
		<div class = "container">
			<h3 class = "text-center">All Pets</h3>
			<hr>
			
				<div class = "container text-right">
				<a href = "<%=request.getContextPath()%>/check" class = "btn btn-success">verify</a>
			</div>
			
			
			<br>
			<h3>Dogs</h3>
			<table class = "table table-bordered">
				<thead class = "thead-light">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Supplies needed</th>
						<th>Care needed</th>
						<th>Notes</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "dog" items = "${listDog}">
						<tr>
							<td><c:out value="${dog.id}" /></td>
							<td><c:out value="${dog.name}" /></td>
							<td><c:out value="${dog.supplies_needed} Meal(s)" /></td>
							<td><c:out value="${dog.care} Hour(s)" /></td>
							<td><c:out value="${dog.notes}" /></td>
							
							<td><a href="editAnimal?id=<c:out value='${dog.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteAnimal?id=<c:out value='${dog.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newAnimal" class = "btn btn-success">Add Dog</a>
			</div>

<!--//Cat/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	
			
			<br>
			<h3>Cats</h3>
			<table class = "table table-bordered">
				<thead class = "thead-light">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Supplies needed</th>
						<th>Care needed</th>
						<th>Notes</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "cat" items = "${listCat}">
						<tr>
							<td><c:out value="${cat.id}" /></td>
							<td><c:out value="${cat.name}" /></td>
							<td><c:out value="${cat.supplies_needed} Meal(s)" /></td>
							<td><c:out value="${cat.care} Hour(s)" /></td>
							<td><c:out value="${cat.notes}" /></td>
							
							<td><a href="editAnimal?id=<c:out value='${cat.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteAnimal?id=<c:out value='${cat.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newAnimal" class = "btn btn-success">Add Cat</a>
			</div>
			
<!--//Bird/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Birds</h3>
			<table class = "table table-bordered">
				<thead class = "thead-light">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Supplies needed</th>
						<th>Care needed</th>
						<th>Notes</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "bird" items = "${listBird}">
						<tr>
							<td><c:out value="${bird.id}" /></td>
							<td><c:out value="${bird.name}" /></td>
							<td><c:out value="${bird.supplies_needed} Meal(s)" /></td>
							<td><c:out value="${bird.care} Hour(s)" /></td>
							<td><c:out value="${bird.notes}" /></td>
							
							<td><a href="editAnimal?id=<c:out value='${bird.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteAnimal?id=<c:out value='${bird.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newAnimal" class = "btn btn-success">Add Bird</a>
			</div>
			
<!--//Reptiles/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Reptiles</h3>
			<table class = "table table-bordered">
				<thead class = "thead-light"> 
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Supplies needed</th>
						<th>Care needed</th>
						<th>Notes</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "reptile" items = "${listReptile}">
						<tr>
							<td><c:out value="${reptile.id}" /></td>
							<td><c:out value="${reptile.name}" /></td>
							<td><c:out value="${reptile.supplies_needed} Meal(s)" /></td>
							<td><c:out value="${reptile.care} Hour(s)" /></td>
							<td><c:out value="${reptile.notes}" /></td>

							<td><a href="editAnimal?id=<c:out value='${reptile.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteAnimal?id=<c:out value='${reptile.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newAnimal" class = "btn btn-success">Add Reptile</a>
			</div>
			
<!--//Horses/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Horses</h3>
			<table class = "table table-bordered">
				<thead class = "thead-light">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Supplies needed</th>
						<th>Care needed</th>
						<th>Notes</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "horse" items = "${listHorse}">
						<tr>
							<td><c:out value="${horse.id}" /></td>
							<td><c:out value="${horse.name}" /></td>
							<td><c:out value="${horse.supplies_needed} Meal(s)" /></td>
							<td><c:out value="${horse.care} Hour(s)" /></td>
							<td><c:out value="${horse.notes}" /></td>
							
							<td><a href="editAnimal?id=<c:out value='${horse.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteAnimal?id=<c:out value='${horse.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newAnimal" class = "btn btn-success">Add Horse</a>
			</div>	
			
<!--//Other/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Other</h3>
			<table class = "table table-bordered">
				<thead class = "thead-light">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Supplies needed</th>
						<th>Care needed</th>
						<th>Notes</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "other" items = "${listOther}">
						<tr>
							<td><c:out value="${other.id}" /></td>
							<td><c:out value="${other.name}" /></td>
							<td><c:out value="${other.supplies_needed}" /></td>
							<td><c:out value="${other.care}" /></td>
							<td><c:out value="${other.notes}" /></td>
							<td><a href="editAnimal?id=<c:out value='${other.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteAnimal?id=<c:out value='${other.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newAnimal" class = "btn btn-success">Add Other</a>
			</div>
			<br>
			<br>
			<br>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
