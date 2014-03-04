<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>

<html>
<head>
	<title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>
<body>

<div class="container">
	<h1><a href="/mediapp/controlPanel">MediApp Control Panel</a></h1>

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<ul class="nav">
				<li class="active"><a href="/mediapp/usersPanel">Users Panel</a></li>
				<li><a href="/mediapp/clinicsPanel">Clinics Panel</a></li>	
			</ul>
		</div>
	</div>
</div>
<hr>
<div class="row">
	<div class="span4">
		<ul class="nav nav-list">
			<li class="nav-header">Actions</li>
			<li class="active"><a href="#">Create User</a></li>
			<li><a href="#">Search Users</a></li>
		</ul>
	</div>
	<div class="span8">
		<div class="hero-unit">	
			<h3>Create User</h3>
		</div>
	</div>
	
</div>
<hr>
</div>



<form action="/mediapp/controlPanel">
<button type="submit">Control Panel</button>
</form>


<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>
