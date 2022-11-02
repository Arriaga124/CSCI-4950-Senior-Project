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

<body>

	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>

    <div class="container col-md-5">
    <br>
    <h1>Test Results</h1>
		<br>
			<h3>Supplies Results</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>Animal Type</th>
						<th>Total Meals Needed</th>
						<th>Total Meals in Stock</th>
						<th>Results</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><c:out value="Dog" /></td>
							<td><c:out value="${dogSupplyNeedTotal}" /></td>
							<td><c:out value="${dogSupplyTotal}" /></td>
							<td><c:out value="${dogValidity == true ? 'Pass' : 'Fail'}" /></td>
						</tr>   	
		
						<tr>
							<td><c:out value="Cat" /></td>
							<td><c:out value="${catSupplyNeedTotal}" /></td>
							<td><c:out value="${catSupplyTotal}" /></td>
							<td><c:out value="${catValidity == true ?  'Pass' : 'Fail'}" /></td>
						</tr>
						
						<tr>
							<td><c:out value="Bird" /></td>
							<td><c:out value="${birdSupplyNeedTotal}" /></td>
							<td><c:out value="${birdSupplyTotal}" /></td>
							<td><c:out value="${birdValidity == true ? 'Pass' : 'Fail'}" /></td>
						</tr>
						
						<tr>
							<td><c:out value="Reptile" /></td>
							<td><c:out value="${reptileSupplyNeedTotal}" /></td>
							<td><c:out value="${reptileSupplyTotal}" /></td>
							<td><c:out value="${reptileValidity == true ? 'Pass' : 'Fail'}" /></td>
						</tr>
						
						<tr>
							<td><c:out value="Horse" /></td>
							<td><c:out value="${horseSupplyNeedTotal}" /></td>
							<td><c:out value="${horseSupplyTotal}" /></td>
							<td><c:out value="${horseValidity == true ? 'Pass' : 'Fail'}" /></td>
						</tr>
						
						<tr>
							<td><c:out value="Other" /></td>
							<td><c:out value="${otherSupplyNeedTotal}" /></td>
							<td><c:out value="${otherSupplyTotal}" /></td>
							<td><c:out value="${otherValidity == true ? 'Pass' : 'Fail'}" /></td>
						</tr>
				</tbody>
			</table>
			
			<br>
			<h3>Staffing Results</h3>
			<table class = "table table-bordered">
				<thead>
					<tr>
						<th>Total Care Needed</th>
						<th>Total Care Available</th>
						<th>Results</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><c:out value="${careNeedTotal}" /></td>
							<td><c:out value="${careTotal}" /></td>
							<td><c:out value="${careValidity == true ? 'Pass' : 'Fail'}" /></td>
						</tr>
					
				</tbody>
			</table>
				<button type="submit" class="btn btn-success">Return to Animals</button>
			
			</div>
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
