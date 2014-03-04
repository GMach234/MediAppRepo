<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>MediApp User View</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.css"/>" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" type="text/css">
</head>
<body>

<div class="container">
	<h1><a href="/mediapp/controlPanel">MediApp Control Panel</a></h1>

<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<ul class="nav">
				<li><a href="/mediapp/usersPanel">Users Panel</a></li>
				<li><a href="/mediapp/clinicsPanel">Clinics Panel</a></li>
				<li><a href="#">Logout</a>	
			</ul>
		</div>
	</div>
</div>
<hr>
<div class="row">
	<div class="span4">
		<ul class="nav nav-list">
			<li class="nav-header">Actions</li>
			<li><a href="#">Create User</a></li>
			<li class="active"><a href="#">Search Users</a></li>
		</ul>
	</div>
	<div class="span8">
		<div class="hero-unit">	
		</div>
	</div>
	
</div>
<hr>
</div>

<h2>${user.name}</h2>

		<p>Name: ${user.name}</p>
		<p>ID: ${user.id}</p>
		<p>Address: ${user.address}</p>
		<p>Phone: ${user.phone}</p>
		<p>Email: ${user.email}</p>
		<p>Type: ${user.type}</p>
		<br>

		<form:form method="POST" action="/mediapp/usersPanel/removeUser">
			<form:label path="id"></form:label>
			<form:input path="id" type="hidden" value='${user.id}' />
			<input type="submit" value="Remove"/>
		</form:form>
		
		
		<h2>Add Clinic</h2>
		<form:form method="POST" action="/mediapp/clinicsPanel/clinicSearchResults">
			<table>
				<tr>
					<td><form:label path="country">Country</form:label></td>
					<td><form:input path="country"/></td>
				</tr>
				<tr>
					<td><form:label path="province">Province</form:label></td>
					<td><form:input path="province"/></td>
				</tr>
				<tr>
					<td><form:label path="town">Town</form:label></td>
					<td><form:input path="town"/></td>
				</tr>
				<tr>
					<td><form:label path="name">Name</form:label></td>
					<td><form:input path="name"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="Search"/>
				</tr>
			</table>
		</form:form>
		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>			
</body>
</html>