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

	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
	
	<div class="container col-md-5">
	<br>
		<div class="card">
			<div class="card-body">
				<c:if test="${animal != null}">
					<form action="updateAnimal" method="post">
				</c:if>
				<c:if test="${animal == null}">
					<form action="insertAnimal" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${animal != null}">
            			Edit Animal
            		</c:if>
						<c:if test="${animal == null}">
            			Enroll New Animal
            		</c:if>
					</h2>
				</caption>

				<c:if test="${animal != null}">
					<input type="hidden" name="id" value="<c:out value='${animal.id}' />" />
				</c:if>


				<fieldset class="form-group">
					<label>Animal Name*</label> <input type="text"
						value="<c:out value='${animal.name}' />" class="form-control"
						name="name" required="required" >
				</fieldset>

				<fieldset class="form-group">
					<label>Amount of Needed Supplies* (Meals required daily)</label> <input type="number"
						value="<c:out value='${animal.supplies_needed}' />" class="form-control"
						name="supplies_needed" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Care Needed* (Hours of care needed daily)</label> <input type="number"
						value="<c:out value='${animal.care}' />" class="form-control"
						name="care" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Species*</label> 
					<select class="form-control"
						name="species" >
						<c:if test="${animal != null}">
						 <option value=<c:out value='${animal.species}' />><c:out value='${animal.species}' /></option>
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
					<label>Breed</label> <input type="text"
						value="<c:out value='${animal.breed}' />" class="form-control"
						name="breed">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Age</label> <input type="text"
						value="<c:out value='${animal.age}' />" class="form-control"
						name="age">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Gender</label> 
					<select class="form-control"
						name="gender">
						<c:if test="${animal != null}">
						 <option value=<c:out value='${animal.gender}' />><c:out value='${animal.gender}' /></option>
				        </c:if>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
						<option value="Unknown">Unknown</option>
					</select>
				</fieldset>
				
				<fieldset class="form-group">
					<label>Color</label> <input type="text"
						value="<c:out value='${animal.color}' />" class="form-control"
						name="color">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Declawed</label> 
					<select class="form-control"
						name="declawed">
						<option value="Yes">Yes</option>
						<option value="No">No</option>
					    <option value="N/A">N/A</option>		
					</select>
				</fieldset>
				
				<fieldset class="form-group">
					<label>Location In Shelter</label> <input type="text"
						value="<c:out value='${animal.location}' />" class="form-control"
						name="location">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Intake Date*</label> <input type="date"
						value="<c:out value='${animal.intake_date}' />" class="form-control"
						name="intake_date" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Available</label> 
					<select class="form-control"
						name="available">
						<c:if test="${animal != null}">
						 <option value=<c:out value='${animal.available}' />><c:out value='${animal.available}' /></option>
				        </c:if>
						<option value="true">Yes</option>
						<option value="false">No</option>
					</select>
				</fieldset>
				
				<fieldset class="form-group">
					<label>Notes</label> <input type="text"
						value="<c:out value='${animal.notes}' />" class="form-control"
						name="notes">
				</fieldset>

				<a href = "<%=request.getContextPath()%>/list" class = "btn btn-success">Back</a>
				<button type="submit" class="btn btn-success" style="margin-left: 10px">Save</button>
				</form>

			</div>
		</div>
		<br><br>
	</div>
	<br><br>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
