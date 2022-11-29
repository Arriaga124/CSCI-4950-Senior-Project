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
<title>All Supplies</title>
<link rel = "stylesheet"
	href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity = "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin = "anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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

	<div class = "row" style="width:100%;">
		

		<div class = "container">
	
			<h3 class = "text-center">Supplies</h3>
			<hr>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  				<input type="text" id="myInput" class="mr-5 w-50" onkeyup="searchTableColumns()" placeholder="Search by Name, Type or Animal" title="Search Supplies">
  				<a href = "<%=request.getContextPath()%>/newSupply" class = "btn btn-success">Add Supplies</a>
			</div>
			<br>
			
			<h3>Supplies</h3>
			<table id="supplyTable" class = "table table-bordered">
				<thead class = "thead-light">
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
							<td>
							<a href="editSupply?id=<c:out value='${supply.id}' />" title="Edit"><i class="material-icons text-secondary" style="font-size:25px;">edit</i></a>
							<a href="deleteSupply?id=<c:out value='${supply.id}' />" title="Delete"><span class="material-symbols-outlined text-danger ml-2">delete</span></a>
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

	function searchTableColumns() {
 
  	    var input, filter, table, tr, i, j, column_length, count_td;
  	    column_length = document.getElementById('supplyTable').rows[0].cells.length;
  	    input = document.getElementById("myInput");
 	    filter = input.value.toUpperCase();
 	    table = document.getElementById("supplyTable");
    	tr = table.getElementsByTagName("tr");
    	for (i = 1; i < tr.length; i++) { // except first(heading) row
      	count_td = 0;
      	for(j = 1; j < column_length-2; j++){ // except first and last 2 columns
          	td = tr[i].getElementsByTagName("td")[j];
          	if (td) {
            	if ( td.innerHTML.toUpperCase().indexOf(filter) > -1)  {            
              	count_td++;
            	}
          	}
      	}
      	if(count_td > 0){
          	tr[i].style.display = "";
      	} else {
         	 tr[i].style.display = "none";
      	}
    	}
    
  	}
	</script>
</body>
</html>
