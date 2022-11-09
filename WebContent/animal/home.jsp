<%@ page language = "java" contentType = "text/html; charset = UTF-8"
	pageEncoding = "UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Protective Paws Home</title>
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style><%@include file="/css/styles.css"%></style>	
</head>
<body>
	<jsp:include page="../common/home-navbar.jsp"></jsp:include>
	
	<div class="container pt-4">
	
	<div class="row text-center">	
	 <div class="col"><a href = "<%=request.getContextPath()%>/list"  class="btn btn-primary text-center"><i class="material-icons" style="font-size:65px;">pets</i><br>View Pets</a></div>
	 <div class="col"><a href = "<%=request.getContextPath()%>/staff-list" class="btn btn-primary text-center"><i class="material-icons" style="font-size:65px;">group</i><br>View Staff</a></div>
	 <div class="col"><a href = "<%=request.getContextPath()%>/supply-list" class="btn btn-primary text-center"><i class="material-icons" style="font-size:65px;">trolley</i><br>View Supply</a></div>
	 <div class="col"><a href = "<%=request.getContextPath()%>/check" class="btn btn-success text-center"><i class="material-icons" style="font-size:65px;">check_circle</i><br>Run Check</a></div>
	</div>
	
	
    <div class="row text-center " style=" margin-top: 20px;">
    
    <div class="col border" style=" margin-right: 5px;"> 
    <div id="chart_div" class="container" ></div>
    </div>
   
    <div class="col border" style=" margin-left: 5px;">
    
    <h2>Task List</h2>
    
    <form class="form-inline" action="<%=request.getContextPath()%>/insertTask" method="post">
    <input type="text" class="form-control mb-2 mr-sm-2" id="email2" placeholder="Enter Task Here" name="task">
    
    <fieldset class="form-group">
					<label class="mb-2 mr-sm-2">Priority:</label> 
					<select class="form-control mb-2 mr-sm-2"
						name="priority" >
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
			<td><span class="badge badge-warning"><c:out value="${task.priority}" /></span></td>
						
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
   	         'title' : 'Animals in Shelter', //title which will be shown right above the Google Pie Chart
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