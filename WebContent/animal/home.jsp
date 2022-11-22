<%
	if (session.getAttribute("name")==null){
		response.sendRedirect("login/login.jsp");
	}
%>

<%@ page language = "java" contentType = "text/html; charset = UTF-8"
	pageEncoding = "UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Protective Paws</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
<style>
<%@include file="/css/styles.css"%>	
</style>	
</head>
<body>
	<jsp:include page="../common/home-navbar.jsp"></jsp:include>
	
	<div class="container mt-2">
	
	<div class="row" >
	<div class="col-sm-10 text-center" >	
	<div class="row ">
	 <div class="col"><a href = "<%=request.getContextPath()%>/list"  class=" text-center text-info"><i class="material-icons" style="font-size:60px;">pets</i><br>View Pets</a></div>
	 <div class="col"><a href = "<%=request.getContextPath()%>/staff-list" class=" text-center text-info"><i class="material-icons" style="font-size:60px;">group</i><br>View Staff</a></div>
	 <div class="col"><a href = "<%=request.getContextPath()%>/supply-list" class=" text-center text-info"><i class="material-icons" style="font-size:60px;">trolley</i><br>View Supply</a></div>
	 <div class="col"><a href = "<%=request.getContextPath()%>/check" class=" text-center text-success"><i class="material-icons" style="font-size:60px;">check_circle</i><br>Run Check</a></div>
	</div>
	</div>
	
	<div class="col-sm-2 text-center border-left" >	
	<div class="row">
	 <div class="col">
	 <h5>Total Animals</h5>
	 <p style=" font-size: 21px;" >${totalAnimals}</p>
	 </div>
	</div>
	</div>
	</div>
	
    <div class="row text-center mt-3" >
    
    	<div class="col border rounded" style=" margin-right: 5px; background-color: white;">
      	<h4 class="mt-2">Animals In Shelter</h4> 
    	<div id="chart_div" class="container" ></div>
    </div>
   
    <div class="col border rounded" style=" margin-left: 5px; background-color: white;">
    	<h4 class="mt-2">Task List</h4>
    	<form class="form-inline mt-4" action="<%=request.getContextPath()%>/insertTask" method="post" autocomplete="off">
    		<input type="text" class="form-control mb-2 mr-sm-2" id="email2" placeholder="Enter Task Here" name="task" required>
    
    			<fieldset class="form-group">
						<label class="mb-2 mr-sm-2">Priority:</label> 
							<select class="form-control mb-2 mr-sm-2" name="priority" >
								<option value="Low" selected>Low</option>
								<option value="Medium">Medium</option>
								<option value="High">High</option>
							</select>
				</fieldset>
    		<button type="submit" class="btn btn-primary mb-2">Add</button>
  		</form>

   	<table class="fixed_header">
  	 <thead>
    	<tr>
     	 <th>Task</th>
     	 <th>Priority</th>
    	  <th>Action</th>
  	 </tr>
 	 </thead>
  		<tbody>
			<c:forEach var = "task" items = "${listTasks}">
			<tr>
				<td><c:out value="${task.task}" /></td>
				
				<c:if test = "${task.priority == 'Low'}" >
				<td><span class="badge badge-success"><c:out value="${task.priority}" /></span></td>
				</c:if>
				<c:if test = "${task.priority == 'Medium'}" >
				<td><span class="badge badge-warning"><c:out value="${task.priority}" /></span></td>
				</c:if>
				<c:if test = "${task.priority == 'High'}" >
				<td><span class="badge badge-danger"><c:out value="${task.priority}" /></span></td>
				</c:if>				
				<td><a	href="deleteTask?id=<c:out value='${task.id}' />"><i class="material-icons" style="font-size:23px;">cancel</i></a></td>
			</tr>
			</c:forEach>
		</tbody>			
	</table>
    </div>
    </div>
    
    </div>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
  	   // Load the Visualization API and the piechart package.
  	   google.charts.load('current', {'packages':['corechart']});
    
  	   // Set a callback to run when the Google Visualization API is loaded.
  	   google.charts.setOnLoadCallback(drawChart);
    
 	   // Callback that creates and populates a data table,
 	   // instantiates the pie chart, passes in the data and
 	   // draws it.
 	   function drawChart() {
        
  	      var data = google.visualization.arrayToDataTable([
   	           ['Animal', 'Quantity'],
   	           <c:forEach items="${speciesCount}" var="entry">
   	               [ '${entry.key}', ${entry.value} ],
   	           </c:forEach>
   	     ]);
                    
  	      // Set chart options
  	      var options = {
   	        // 'title' : '',title which will be shown right above the Google Pie Chart
  	          is3D : true, //render Google Pie Chart as 3D
  	          pieSliceText: 'label', //on mouse hover show label
  	          tooltip :  {showColorCode: true}, // whether to display color code for animal on mouse hover
  	          legend: { position: 'none' }, // hides the chart legend
   	         'width' : 480, //width of the Google Pie Chart 
  	         'height' : 450 //height of the Google Pie Chart 
   	     };
        
   	     // Instantiate and draw chart, passing in some options.
  	      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
  	      chart.draw(data, options);
  	  }
	</script>
    
</body>
</html>