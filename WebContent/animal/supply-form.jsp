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
				<li><a href="<%=request.getContextPath()%>/supply-list"
					class="nav-link">Supplies</a></li>
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
				<c:if test="${supply != null}">
					<form action="updateSupply" method="post">
				</c:if>
				<c:if test="${supply == null}">
					<form action="insertSupply" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${supply != null}">
            			Edit Supply
            		</c:if>
						<c:if test="${supply == null}">
            			Stock New Supply
            		</c:if>
					</h2>
				</caption>

				<c:if test="${supply != null}">
					<input type="hidden" name="id" value="<c:out value='${supply.id}' />" />
				</c:if>


				<fieldset class="form-group">
					<label>Supply Type</label> <input type="text"
						value="<c:out value='${supply.type}' />" class="form-control"
						name="type" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Animal</label> <input type="text"
						value="<c:out value='${supply.animal}' />" class="form-control"
						name="animal" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Amount</label> <input type="number"
						value="<c:out value='${supply.amount}' />" class="form-control"
						name="amount" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
