<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;600&display=swap" rel="stylesheet">

<header>
	<nav class = "navbar navbar-expand-md navbar-dark" style = "background-color: rgb(34,93,196) ">
			<div>
				<a href = "<%=request.getContextPath()%>/home" class = "navbar-brand"> Protective Paws</a>
			</div>
			<ul class = "navbar-nav">
				<li><a href = "<%=request.getContextPath()%>/list"
					class = "nav-link">Animals</a></li>
			</ul>
			<ul class = "navbar-nav">
				<li><a href = "<%=request.getContextPath()%>/supply-list"
					class = "nav-link">Supplies</a></li>
			</ul>
			<ul class = "navbar-nav">
				<li><a href = "<%=request.getContextPath()%>/staff-list"
					class="nav-link">Staff</a></li>
			</ul>
			<ul class = "navbar-nav navbar-collapse justify-content-end">
				<li><a href = "<%=request.getContextPath()%>/logout"
					class = "nav-link">Logout</a></li>
			</ul>
		</nav>
</header>