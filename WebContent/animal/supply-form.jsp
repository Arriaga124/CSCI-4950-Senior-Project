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
<title>Supply Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">	
<style>
	<%@include file="/css/styles.css"%>
	label{
		margin-top: 10px;
		}
</style>
</head>

<body>

	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
	<div class="container col-md-5 mt-4">
		<div class="card">
			<div class="card-body">
				<c:if test="${supply != null}">
					<form action="updateSupply" method="post" autocomplete="off">
				</c:if>
				<c:if test="${supply == null}">
					<form action="insertSupply" method="post" autocomplete="off">
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
					<label>Supply Name</label> <input type="text"
						value="<c:out value='${supply.supply_name}' />" class="form-control"
						name="supply_name" id="supply_name" required="required" >
				</fieldset>
  
  				<fieldset class="form-group">
					<label>Supply Type</label> 
					<select class="form-control"
						name="type" id="type">
						<c:if test="${supply != null}">
						 <optgroup label="Selected">
						 <option value=<c:out value='${supply.type}' />><c:out value='${supply.type}' /></option>
						 </optgroup>
				        </c:if>
						<option value="Accessories">Accessories</option>
						<option value="Care & Wellness">Care & Wellness</option>
						<option value="Food">Food</option>
						<option value="General Supplies">General Supplies</option>
						<option value="Litter">Litter</option>
						<option value="Toys">Toys</option>
						<option value="Treats">Treats</option>
						<option value="Other">Other</option>
					</select>
				</fieldset>
  
  				<fieldset class="form-group">
					<label>Animal</label> 
					<select class="form-control" name="animal" id="animal" >
						<c:if test="${supply != null}">
						 <optgroup label="Selected">
						 <option value=<c:out value='${supply.animal}' />><c:out value='${supply.animal}' /></option>
						 </optgroup>
				        </c:if>
						<option value="Bird">Bird</option>
						<option value="Cat">Cat</option>
						<option value="Dog">Dog</option>
						<option value="Horse">Horse</option>
						<option value="Reptile">Reptile</option>
						<option value="Other">Other</option>
					</select>
				</fieldset>

  				<fieldset class="form-group">
					<label>Amount:</label> 
					<input type="number" value="<c:out value='${supply.amount}' />" class="form-control" name="amount"  id="amount" required="required">
				</fieldset>
								
				
				<button type="submit" class="btn btn-success w-100" >Save</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
