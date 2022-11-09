<header>
	<nav class = "navbar navbar-expand-md navbar-dark" style = "background-color: rgb(34,93,196) ">
			<div>
				<a href = "<%=request.getContextPath()%>/home" class = "navbar-brand" style="color:white;"> Protective Paws</a>
			</div>
			<ul class = "navbar-nav navbar-collapse justify-content-end" style="color:white;">
				<li><h4>Welcome <%=session.getAttribute("name")%>!</h4></li>
			</ul>
			<ul class = "navbar-nav navbar-collapse justify-content-end">
				<li><a href = "<%=request.getContextPath()%>/logout"
					class = "nav-link">Logout</a></li>
			</ul>
		</nav>
</header>
