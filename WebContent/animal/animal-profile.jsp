<%
	if (session.getAttribute("name")==null){
		response.sendRedirect("login/login.jsp");
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Animal Profile</title>
<link rel = "stylesheet"
	href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity = "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin = "anonymous">
<style><%@include file="/css/styles.css"%></style>
</head>
<body>

<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>

	<div class="container col-md-4 mt-4" style="background-color: white;">
		
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>ID</p></div>
			<div class="col"><p><c:out value="${animal.id}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Name</p></div>
			<div class="col"><p><c:out value="${animal.name}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Supplies Needed</p></div>
			<div class="col"><p><c:out value="${animal.supplies_needed}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Care</p></div>
			<div class="col"><p><c:out value="${animal.care}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Species</p></div>
			<div class="col"><p><c:out value="${animal.species}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Breed</p></div>
			<div class="col"><p><c:out value="${animal.breed}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Age</p></div>
			<div class="col"><p><c:out value="${animal.age}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Gender</p></div>
			<div class="col"><p><c:out value="${animal.gender}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Color</p></div>
			<div class="col"><p><c:out value="${animal.color}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Declawed?</p></div>
			<div class="col"><p><c:out value="${animal.declawed}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Location</p></div>
			<div class="col"><p><c:out value="${animal.location}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Intake Date</p></div>
			<div class="col"><p><c:out value="${animal.intake_date}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Available?</p></div>
			<div class="col"><p><c:out value="${animal.available == true ? 'Yes' : 'No'}" /></p></div>
		</div>
		<div class="row border">
			<div class="col-sm-3 border-right font-weight-bold"><p>Notes</p></div>
			<div class="col"><p><c:out value="${animal.notes}" /></p></div>
		</div>
	</div>
	<div class="container col-md-4 mt-3">
			<a href = "<%=request.getContextPath()%>/list" class = "btn btn-success mr-2">Return to Animals</a>
			<a href="editAnimal?id=<c:out value='${animal.id}'/>" class = "btn btn-warning">Edit</a>
	</div>	
	<br>
</body>
</html>