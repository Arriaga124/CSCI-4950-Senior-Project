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
<title>All Pets</title>
<link rel = "stylesheet"
	href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity = "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin = "anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	<%@include file="/css/styles.css"%>
	table{
		background-color: white;
	}
</style>
</head>	

<body>

<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
<!--//Dog/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	
		<div class = "row" style="width:100%;">
			
		<div class = "container">
			<h3 class = "text-center">All Pets</h3>
			
			
  
			
			
			<hr>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  				<input type="text" id="myInput" class="mr-5 w-50" onkeyup="searchTables()" placeholder="Search by ID or Name" title="Search Animals">
  				<a href = "<%=request.getContextPath()%>/newAnimal" class = "btn btn-success mr-2">Enroll New Animal</a>
				<a href = "<%=request.getContextPath()%>/check" class = "btn btn-success">Verify</a>
			<button type="button" class = "btn btn-success ml-2" style = "color: white" data-toggle="collapse" data-target="#collapseHelp">?</button>
			</div>
			
			<div class="collapse mt-2" id="collapseHelp">
			<div class="card card-body">
  			All pets are displayed by type down below. There is a Enroll animal button to add animals, a search bar for direct searching, Also on each animal entry there three additional icons to edit - view in depth - and delete. Lastly there is a verify button that will perform a check upon clicking to ensure the animals have the supplies and care needed. To get started click the Enroll New Animal Button!
   			</div>
   			</div>
		
					
			<br>
			<h3>Dogs</h3>
			<table class = "table table-bordered animalTable">
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
							<td>
								<a href="showProfile?id=<c:out value='${dog.id}' />" title="View Full Profile"><span class="material-symbols-outlined text-warning ml-2">folder_open</span></a>
								<a href="editAnimal?id=<c:out value='${dog.id}' />" title="Edit"><i class="material-icons text-secondary" style="font-size:25px;">edit</i></a>
								<a href="deleteAnimal?id=<c:out value='${dog.id}' />" title="Delete"><span class="material-symbols-outlined text-danger ml-2">delete</span></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

<!--//Cat/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->	
			
			<br>
			<h3>Cats</h3>
			<table class = "table table-bordered animalTable">
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
							<td class="text-left">
								<a href="showProfile?id=<c:out value='${cat.id}' />" title="View Full Profile"><span class="material-symbols-outlined text-warning ml-2">folder_open</span></a>
								<a href="editAnimal?id=<c:out value='${cat.id}' />" title="Edit"><i class="material-icons text-secondary" style="font-size:25px;">edit</i></a>
								<a href="deleteAnimal?id=<c:out value='${cat.id}' />" title="Delete"><span class="material-symbols-outlined text-danger ml-2">delete</span></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
<!--//Bird/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Birds</h3>
			<table class = "table table-bordered animalTable">
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
							<td class="text-left">
								<a href="showProfile?id=<c:out value='${bird.id}' />" title="View Full Profile"><span class="material-symbols-outlined text-warning ml-2">folder_open</span></a>
								<a href="editAnimal?id=<c:out value='${bird.id}' />" title="Edit"><i class="material-icons text-secondary" style="font-size:25px;">edit</i></a>
								<a href="deleteAnimal?id=<c:out value='${bird.id}' />" title="Delete"><span class="material-symbols-outlined text-danger ml-2">delete</span></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
<!--//Reptiles/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Reptiles</h3>
			<table class = "table table-bordered animalTable">
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
							<td class="text-left">
								<a href="showProfile?id=<c:out value='${reptile.id}' />" title="View Full Profile"><span class="material-symbols-outlined text-warning ml-2">folder_open</span></a>
								<a href="editAnimal?id=<c:out value='${reptile.id}' />" title="Edit"><i class="material-icons text-secondary" style="font-size:25px;">edit</i></a>
								<a href="deleteAnimal?id=<c:out value='${reptile.id}' />" title="Delete"><span class="material-symbols-outlined text-danger ml-2">delete</span></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
<!--//Horses/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Horses</h3>
			<table class = "table table-bordered animalTable">
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
							<td class="text-left">
								<a href="showProfile?id=<c:out value='${horse.id}' />" title="View Full Profile"><span class="material-symbols-outlined text-warning ml-2">folder_open</span></a>
								<a href="editAnimal?id=<c:out value='${horse.id}' />" title="Edit"><i class="material-icons text-secondary" style="font-size:25px;">edit</i></a>
								<a href="deleteAnimal?id=<c:out value='${horse.id}' />" title="Delete"><span class="material-symbols-outlined text-danger ml-2">delete</span></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
<!--//Other/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->

			<br>
			<h3>Other</h3>
			<table class = "table table-bordered animalTable">
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
							<td><c:out value="${other.supplies_needed} Meal(s)" /></td>
							<td><c:out value="${other.care} Hours(s)" /></td>
							<td><c:out value="${other.notes}" /></td>
							<td class="text-left">
								<a href="showProfile?id=<c:out value='${other.id}' />" title="View Full Profile"><span class="material-symbols-outlined text-warning ml-2">folder_open</span></a>
								<a href="editAnimal?id=<c:out value='${other.id}' />" title="Edit"><i class="material-icons text-secondary" style="font-size:25px;">edit</i></a>
								<a href="deleteAnimal?id=<c:out value='${other.id}' />" title="Delete"><span class="material-symbols-outlined text-danger ml-2">delete</span></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<br>
			<br>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>
	function searchTables() {
	    // Declare variables
	    var input, filter, tables, tr, td, i;
	    input = document.getElementById("myInput");
	    filter = input.value.toUpperCase();
	    tables = document.getElementsByClassName("animalTable");
	    
	    for(var k = 0; k < tables.length; k++) {
	        tr = tables[k].getElementsByTagName("tr");
	        // Loop through all table rows, and hide those who don't match the search query
	        for (i = 0; i < tr.length; i++) {
	            if (!tr[i].classList.contains('header')) {
	                td = tr[i].getElementsByTagName("td"),
	                    match = false;
	                for (j = 0; j < td.length -4; j++) {
	                    if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
	                        match = true;
	                        break;
	                    }
	                }
	                if (!match) {
	                    tr[i].style.display = "none";
	                } else {
	                    tr[i].style.display = "";
	                    tr[0].style.display = "";
	                }
	            }
	        }
	    }
	}
	</script>
</body>
</html>
