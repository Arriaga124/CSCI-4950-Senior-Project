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

</head>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: rgb(34,93,196)">
			<div>
				<a  class="navbar-brand"> Protective Paws</a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Animals</a></li>
			</ul>

			<ul class="navbar-nav navbar-collapse justify-content-end">
				<li><a href="<%=request.getContextPath()%>/logout"
					class="nav-link">Logout</a></li>
			</ul>
		</nav>
	</header>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${cat != null}">
					<form action="updateCat" method="post">
				</c:if>
				<c:if test="${cat == null}">
					<form action="insertCat" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${cat != null}">
            			Edit Cat
            		</c:if>
						<c:if test="${cat == null}">
            			Enroll New Cat
            		</c:if>
					</h2>
				</caption>

				<c:if test="${cat != null}">
					<input type="hidden" name="id" value="<c:out value='${cat.id}' />" />
				</c:if>


				<fieldset class="form-group">
					<label>Cat Name</label> <input type="text"
						value="<c:out value='${cat.name}' />" class="form-control"
						name="name" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Amount of Needed Supplies (Meals required daily)</label> <input type="number"
						value="<c:out value='${cat.supplies_needed}' />" class="form-control"
						name="supplies_needed" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Care Needed (Hours of care needed daily)</label> <input type="number"
						value="<c:out value='${cat.care}' />" class="form-control"
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
