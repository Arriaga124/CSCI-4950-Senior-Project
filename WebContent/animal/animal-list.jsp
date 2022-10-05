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

<!--//Navbar/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	

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
		
<!--//Dog/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	

		<div class = "container">
			<h3 class = "text-center">All Pets</h3>
			<hr>
			<br>
			<h3>Dogs</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Supplies Needed</th>
						<th>Care Needed</th>
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

							<td><a href="editDog?id=<c:out value='${dog.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteDog?id=<c:out value='${dog.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newDog" class = "btn btn-success">Add Dog</a>
			</div>
			
<!--//Cat/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	
			
			<br>
			<h3>Cats</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Care needed</th>
						<th>Supplies needed</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "cat" items = "${listCat}">
						<tr>
							<td><c:out value="${cat.id}" /></td>
							<td><c:out value="${cat.name}" /></td>
							<td><c:out value="${cat.supplies_needed}" /></td>
							<td><c:out value="${cat.care}" /></td>
							<td><a href="editCat?id=<c:out value='${cat.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteCat?id=<c:out value='${cat.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newCat" class = "btn btn-success">Add Cat</a>
			</div>
			
<!--//Bird/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Birds</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Care needed</th>
						<th>Supplies needed</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "bird" items = "${listBird}">
						<tr>
							<td><c:out value="${bird.id}" /></td>
							<td><c:out value="${bird.name}" /></td>
							<td><c:out value="${bird.supplies_needed}" /></td>
							<td><c:out value="${bird.care}" /></td>
							<td><a href="editBird?id=<c:out value='${bird.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteBird?id=<c:out value='${bird.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newBird" class = "btn btn-success">Add Bird</a>
			</div>
			
<!--//Reptiles/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Reptiles</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Care needed</th>
						<th>Supplies needed</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "reptile" items = "${listReptile}">
						<tr>
							<td><c:out value="${reptile.id}" /></td>
							<td><c:out value="${reptile.name}" /></td>
							<td><c:out value="${reptile.supplies_needed}" /></td>
							<td><c:out value="${reptile.care}" /></td>

							<td><a href="editReptile?id=<c:out value='${reptile.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteReptile?id=<c:out value='${reptile.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newReptile" class = "btn btn-success">Add Reptile</a>
			</div>
			
<!--//Horses/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Horses</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Care needed</th>
						<th>Supplies needed</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var = "horse" items = "${listHorse}">
						<tr>
							<td><c:out value="${horse.id}" /></td>
							<td><c:out value="${horse.name}" /></td>
							<td><c:out value="${horse.supplies_needed}" /></td>
							<td><c:out value="${horse.care}" /></td>
							<td><a href="editHorse?id=<c:out value='${horse.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteHorse?id=<c:out value='${horse.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newHorse" class = "btn btn-success">Add Horse</a>
			</div>	
			
<!--//Other/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Other</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Care needed</th>
						<th>Supplies needed</th>
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
							<td><a href="editOther?id=<c:out value='${other.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteOther?id=<c:out value='${other.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class = "container text-left">
				<a href = "<%=request.getContextPath()%>/newOther" class = "btn btn-success">Add Other</a>
			</div>
			<br>
			<br>
			<br>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
