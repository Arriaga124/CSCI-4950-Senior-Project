<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;600&display=swap" rel="stylesheet">

<header>
	<nav class = "navbar navbar-expand-md navbar-dark" style = "background-color: rgb(34,93,196) ">
			<div>
				<a href = "<%=request.getContextPath()%>/home" class = "navbar-brand" style="color:white;"> Protective Paws</a>
			</div>
			
			<h5 class = "navbar-nav navbar-collapse text-white  justify-content-end">
				Welcome <%=session.getAttribute("name")%>!</h5>

			
			<ul class = "navbar-nav navbar-collapse justify-content-end">
				<li><a href = "<%=request.getContextPath()%>/logout"
					class = "nav-link">Logout</a></li>
			</ul>
		</nav>
</header>
