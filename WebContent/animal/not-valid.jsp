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
<title>Protective Paws</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style><%@include file="/css/styles.css"%></style>
</head>

</head>
<body>

	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
	
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${bird != null}">
					<form action="updateBird" method="post">
				</c:if>
				<c:if test="${bird == null}">
					<form action="insertBird" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${bird != null}">
            			Edit Bird
            		</c:if>
						<c:if test="${bird == null}">
            			Enroll New Bird
            		</c:if>
					</h2>
				</caption>

				<c:if test="${bird != null}">
					<input type="hidden" name="id" value="<c:out value='${bird.id}' />" />
				</c:if>


				<fieldset class="form-group">
					<label>Bird Name</label> <input type="text"
						value="<c:out value='${bird.name}' />" class="form-control"
						name="name" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Amount of Needed Supplies (Meals required daily)</label> <input type="number"
						value="<c:out value='${bird.supplies_needed}' />" class="form-control"
						name="supplies_needed" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Care Needed (Hours of care needed daily)</label> <input type="number"
						value="<c:out value='${bird.care}' />" class="form-control"
						name="care" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
