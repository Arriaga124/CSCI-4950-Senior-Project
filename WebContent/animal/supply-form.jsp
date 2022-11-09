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
	
<style>
label{
	margin-top: 10px;
}
</style>

</head>

<body>

	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
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
				
				<label for="supply_name">Supply Name: </label><br>
  				<input type="text" id="supply_name" name="supply_name" style="width: 100%">
  				<br>
  
  				<label for="type">Supply Type: </label><br>
 				<select id="type" name="type" style="width: 100%">
 				    <option value="Accessories">Accessories</option>
 				    <option value="Care & Wellness">Care & Wellness</option>
    				<option value="Food">Food</option>
    				<option value="General Supplies">General Supplies</option>
    				<option value="Litter">Litter</option>
    				<option value="Toys">Toys</option>
    				<option value="Treats">Treats</option>
  				</select>
  				<br>
  
  				<label for="animal">Animal: </label><br>
 			 	<select id="animal" name="animal" style="width: 100%">
    				<option value="Dog">Dog</option>
    				<option value="Cat">Cat</option>
    				<option value="Bird">Bird</option>
    				<option value="Reptile">Reptile</option>
    				<option value="Horse">Horse</option>
    				<option value="Other">Other</option>
  				</select>
  				<br>

  				<label for="amount">Amount: </label><br>
  				<input type="number" id="amount" name="amount" style="width: 100%">
  				<br>
								
				</fieldset>
				<button type="submit" class="btn btn-success" style="width: 100%">Save</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
