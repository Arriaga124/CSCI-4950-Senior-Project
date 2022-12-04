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
<title>All Staff</title>
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

	<div class = "row" style="width:100%;">
		

		<div class = "container">
		
			<h3 class = "text-center">Staff and Volunteers</h3>
			
			
			<hr>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  <input type="text" id="myInput" class="mr-5 w-50" onkeyup="searchTableColumns()" placeholder="Search by ID, Name or Position" title="Search Staff">
                  <a href = "<%=request.getContextPath()%>/newStaff" class = "btn btn-success">Add Staff</a>
                  <button type="button" class = "btn btn-success ml-2" style = "color: white" data-toggle="collapse" data-target="#collapseHelp">?</button>
            </div>

            <div class="collapse mt-2" id="collapseHelp">
              <div class="card card-body">
               All Staff are displayed down below. There is an add staff button to add staff into the system, a search bar for direct searching, Also on each staff member entry there two additional icons representing edit and delete. To get started click the Add Staff Button! 
              </div>
            </div>
			<br>
			<h3>Staff and Volunteers</h3>
			<table id="staffTable" class = "table table-bordered">
				<thead class = "thead-light">
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
							<td>
							<a href="editStaff?id=<c:out value='${staff.id}' />" title="Edit"><i class="material-icons text-secondary" style="font-size:25px;">edit</i></a>
							<a href="deleteStaff?id=<c:out value='${staff.id}' />" title="Delete"><span class="material-symbols-outlined text-danger ml-2 ">delete</span></a>	
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
  	    column_length = document.getElementById('staffTable').rows[0].cells.length;
  	    input = document.getElementById("myInput");
 	    filter = input.value.toUpperCase();
 	    table = document.getElementById("staffTable");
    	tr = table.getElementsByTagName("tr");
    	for (i = 1; i < tr.length; i++) { // except first(heading) row
      	count_td = 0;
      	for(j = 0; j < column_length-3; j++){ // except last 3 columns
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
