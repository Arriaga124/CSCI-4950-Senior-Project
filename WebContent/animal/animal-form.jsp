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
<title>Animal Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style><%@include file="/css/styles.css"%></style>
</head>
<body>

	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	
	
	<div class="container col-md-5">
	<br>
		<div class="card">
			<div class="card-body">
				<c:if test="${animal != null}">
					<form action="updateAnimal" method="post" autocomplete="off">
				</c:if>
				<c:if test="${animal == null}">
					<form action="insertAnimal" method="post" autocomplete="off">
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
					<label>Animal Name*</label> 
					
					<input type="text"
						value="<c:out value='${animal.name}' />" class="form-control mb-1"
						name="name" id="name" required="required">
						<button type="button" onclick="randomName()">Random</button>	
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
						 <optgroup label="Selected">
						 <option value=<c:out value='${animal.species}' />><c:out value='${animal.species}' /></option>
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
						 <optgroup label="Selected">
						 <option value=<c:out value='${animal.gender}' />><c:out value='${animal.gender}' /></option>
						 </optgroup>
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
						<c:if test="${animal != null}">
						 <optgroup label="Selected">
						 <option value=<c:out value='${animal.declawed}' />><c:out value='${animal.declawed}' /></option>
						 </optgroup>
				        </c:if>
				        <option value="N/A">N/A</option>
						<option value="Yes">Yes</option>
						<option value="No">No</option>		
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
						 <optgroup label="Selected">
						 <option value=<c:out value='${animal.available}' />><c:out value="${animal.available == true ? 'Yes' : 'No'}" /></option>
						 </optgroup>
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

				<button type="submit" class="btn btn-success w-100">Save</button>
				</form>
			</div>
		</div>
		<br><br>
	</div>
	<br><br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script>

		var names = Array("Sugar", "Tangerine", "Nectar", "Jelly", "Lolly", "Trixie", "Butters", "Hopper", "Stripe", "Checkers", "Brownie", "Poochie", "Flinch", "Pez", "Truffle", "Paco", 
				"Spud", "Duck", "Chunk", "Nappo", "Mentos", "Raisin", "Dove", "Kit Kat", "Mister Pink", "Crunch", "Pistachio", "Jell-O", "Marble", "Pepper", "Spencer", "Spike", "Stuart", 
				"Tanner", "Taz", "T-bone", "Teddy", "Thor", "Thumper", "Bear", "Ace", "Angel", "Milo", "Finn", "Stella", "Daisy", "Rex", "Lucas", "Mocha", "Misty", "Wesley", "Pixie", "Sophie");

		function randomName() {
  		var randomName = names[Math.floor(Math.random() * names.length)];
  		document.getElementById('name').value = randomName;
		}
	</script>
</body>
</html>
