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
	<%@include file="/css/styles.css"%>
	table{
		background-color: white;
	}
</style>
</head>

<body>

	<!-- Includes navbar from navbar.jsp  -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>

    <div class="container col-md-5">
    <h3 class = "text-center">Test Results</h3>
	<hr>
		<br>
			<h3>Supplies Results</h3>
			<table class = "table table-bordered">
				<thead class = "thead-light">
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
							<c:choose>
    							<c:when test="${dogValidity == true}">
        							<td bgcolor="#97EE81">Pass</td>		
    							</c:when>    
    						<c:otherwise>
									<td bgcolor="#F67777">Fail</td>
    						</c:otherwise>
							</c:choose>
						</tr>   	
		
						<tr>
							<td><c:out value="Cat" /></td>
							<td><c:out value="${catSupplyNeedTotal}" /></td>
							<td><c:out value="${catSupplyTotal}" /></td>
							<c:choose>
    							<c:when test="${catValidity == true}">
        							<td bgcolor="#97EE81">Pass</td>		
    							</c:when>    
    						<c:otherwise>
									<td bgcolor="#F67777">Fail</td>
    						</c:otherwise>
							</c:choose>
						</tr>
						
						<tr>
							<td><c:out value="Bird" /></td>
							<td><c:out value="${birdSupplyNeedTotal}" /></td>
							<td><c:out value="${birdSupplyTotal}" /></td>
							<c:choose>
    							<c:when test="${birdValidity == true}">
        							<td bgcolor="#97EE81">Pass</td>		
    							</c:when>    
    						<c:otherwise>
									<td bgcolor="#F67777">Fail</td>
    						</c:otherwise>
							</c:choose>
						</tr>
						
						<tr>
							<td><c:out value="Reptile" /></td>
							<td><c:out value="${reptileSupplyNeedTotal}" /></td>
							<td><c:out value="${reptileSupplyTotal}" /></td>
							<c:choose>
    							<c:when test="${reptileValidity == true}">
        							<td bgcolor="#97EE81">Pass</td>		
    							</c:when>    
    						<c:otherwise>
									<td bgcolor="#F67777">Fail</td>
    						</c:otherwise>
							</c:choose>
						</tr>
						
						<tr>
							<td><c:out value="Horse" /></td>
							<td><c:out value="${horseSupplyNeedTotal}" /></td>
							<td><c:out value="${horseSupplyTotal}" /></td>
							<c:choose>
    							<c:when test="${horseValidity == true}">
        							<td bgcolor="#97EE81">Pass</td>		
    							</c:when>    
    						<c:otherwise>
									<td bgcolor="#F67777">Fail</td>
    						</c:otherwise>
							</c:choose>
						</tr>
						
						<tr>
							<td><c:out value="Other" /></td>
							<td><c:out value="${otherSupplyNeedTotal}" /></td>
							<td><c:out value="${otherSupplyTotal}" /></td>
							<c:choose>
    							<c:when test="${otherValidity == true}">
        							<td bgcolor="#97EE81">Pass</td>		
    							</c:when>    
    						<c:otherwise>
									<td bgcolor="#F67777">Fail</td>
    						</c:otherwise>
							</c:choose>
						</tr>
				</tbody>
			</table>
			
			<br>
			<h3>Staffing Results</h3>
			<table class = "table table-bordered">
				<thead class = "thead-light">
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
							<c:choose>
    							<c:when test="${careValidity == true}">
        							<td bgcolor="#97EE81">Pass</td>		
    							</c:when>    
    						<c:otherwise>
									<td bgcolor="#F67777">Fail</td>
    						</c:otherwise>
							</c:choose>
						</tr>
					
				</tbody>
			</table>		
				<a href = "<%=request.getContextPath()%>/list" class = "btn btn-success">Return to Animals</a>	
			</div>
			<br>
			<br>
			<br>
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>
