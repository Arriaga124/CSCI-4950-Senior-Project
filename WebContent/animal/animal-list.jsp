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
				<li><a href = "<%=request.getContextPath()%>/list"
					class = "nav-link">Supplies</a></li>
			</ul>
			
			<ul class = "navbar-nav">
				<li><a href = "<%=request.getContextPath()%>/list"
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
		
			<h3 class = "text-center">All Pets</h3>
			
			<hr>
			
			<br>
			<h3>Dogs</h3>
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
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var = "dog" items = "${listDog}">

						<tr>
							<td><c:out value="${dog.id}" /></td>
							<td><c:out value="${dog.name}" /></td>
							<td><c:out value="${dog.supplies_needed}" /></td>
							<td><c:out value="${dog.care}" /></td>

							<td><a href="edit?id=<c:out value='${dog.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${dog.id}' />">Delete</a></td>

							<!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
          							<button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
			
			<div class = "container text-left">

				<a href = "<%=request.getContextPath()%>/new" class = "btn btn-success">Add Dog</a>
			</div>
			
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
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var = "todo" items = "${listTodo}">

						<tr>
							<td><c:out value="${todo.title}" /></td>
							<td><c:out value="${todo.targetDate}" /></td>
							<td><c:out value="${todo.status}" /></td>
							<td><c:out value="${todo.status}" /></td>

							<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${todo.id}' />">Delete</a></td>

							<!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
          							<button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
			
			<div class = "container text-left">

				<a href = "<%=request.getContextPath()%>/new" class = "btn btn-success">Add Cat</a>
			</div>
			
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
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var = "todo" items = "${listTodo}">

						<tr>
							<td><c:out value="${todo.title}" /></td>
							<td><c:out value="${todo.targetDate}" /></td>
							<td><c:out value="${todo.status}" /></td>
							<td><c:out value="${todo.status}" /></td>

							<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${todo.id}' />">Delete</a></td>

							<!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
          							<button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
			
			<div class = "container text-left">

				<a href = "<%=request.getContextPath()%>/new" class = "btn btn-success">Add Bird</a>
			</div>
			
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
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var = "todo" items = "${listTodo}">

						<tr>
							<td><c:out value="${todo.title}" /></td>
							<td><c:out value="${todo.targetDate}" /></td>
							<td><c:out value="${todo.status}" /></td>
							<td><c:out value="${todo.status}" /></td>

							<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${todo.id}' />">Delete</a></td>

							<!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
          							<button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
			
			<div class = "container text-left">

				<a href = "<%=request.getContextPath()%>/new" class = "btn btn-success">Add Reptile</a>
			</div>
			
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
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var = "todo" items = "${listTodo}">

						<tr>
							<td><c:out value="${todo.title}" /></td>
							<td><c:out value="${todo.targetDate}" /></td>
							<td><c:out value="${todo.status}" /></td>
							<td><c:out value="${todo.status}" /></td>

							<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${todo.id}' />">Delete</a></td>

							<!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
          							<button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
			
			<div class = "container text-left">

				<a href = "<%=request.getContextPath()%>/new" class = "btn btn-success">Add Horse</a>
			</div>
			
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
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var = "todo" items = "${listTodo}">

						<tr>
							<td><c:out value="${todo.title}" /></td>
							<td><c:out value="${todo.targetDate}" /></td>
							<td><c:out value="${todo.status}" /></td>
							<td><c:out value="${todo.status}" /></td>

							<td><a href="edit?id=<c:out value='${todo.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${todo.id}' />">Delete</a></td>

							<!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
          							<button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
			
			<div class = "container text-left">

				<a href = "<%=request.getContextPath()%>/new" class = "btn btn-success">Add Other</a>
			</div>
			
			<br>
			<br>
			<br>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
