<%
	if (session.getAttribute("name")==null){
		response.sendRedirect("login/login.jsp");
	}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Staff Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style><%@include file="/css/styles.css"%></style>
</head>

<body>
	
	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
		<div class="container col-md-5 mt-4">
		<div class="card">
			<div class="card-body">
				<c:if test="${staff != null}">
					<form action="updateStaff" method="post" autocomplete="off">
				</c:if>
				<c:if test="${staff == null}">
					<form action="insertStaff" method="post" autocomplete="off">
				</c:if>

				<caption>
					<h2>
						<c:if test="${staff != null}">
            			Edit Staff
            		</c:if>
						<c:if test="${staff == null}">
            			Enroll New Staff
            		</c:if>
					</h2>
				</caption>

				<c:if test="${staff != null}">
					<input type="hidden" name="id" value="<c:out value='${staff.id}' />" />
				</c:if>


				<fieldset class="form-group">
					<label>Staff Name</label> <input type="text"
						value="<c:out value='${staff.name}' />" class="form-control"
						name="name" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Position</label> <input type="text"
						value="<c:out value='${staff.position}' />" class="form-control"
						name="position" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Time</label> <input type="number"
						value="<c:out value='${staff.time}' />" class="form-control"
						name="time" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Phone</label> <input type="text"
						value="<c:out value='${staff.phone}' />" class="form-control"
						name="phone" placeholder="No dashes" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success w-100">Save</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
