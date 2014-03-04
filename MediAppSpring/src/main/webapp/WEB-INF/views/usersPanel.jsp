<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<title>MediApp Home</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css">
	
	<script>	
	function hideView()
	{
	alert("Hello");
	}
	</script>
	
</head>
<body>

<div class="container">
	<h1><a href="/mediapp/controlPanel">MediApp Control Panel</a></h1>

<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<ul class="nav">
				<li class="active"><a href="/mediapp/usersPanel">Users Panel</a></li>
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
			<li class="active"><a href="#">Create User</a></li>
			<li><a href="#">Search Users</a></li>
		</ul>
	</div>
	<div class="span8">
		<div class="hero-unit">
			<h4>Create User</h4>
			
			<form:form method="POST" action="/mediapp/usersPanel/addUser">
				<table>
					<tr>
						<td><form:label path="name">Name</form:label></td>
						<td><form:input path="name"/></td>
					</tr>
					<tr>
						<td><form:label path="address">Address</form:label></td>
						<td><form:input path="address"/></td>
					</tr>
					<tr>
						<td><form:label path="phone">Phone</form:label></td>
						<td><form:input path="phone"/></td>
					</tr>
					<tr>
						<td><form:label path="email">Email</form:label></td>
						<td><form:input path="email"/></td>
					</tr>
					<tr>
						<td><form:label path="password">Password</form:label></td>
						<td><form:input type="password" path="password"/></td>
					</tr>
					<tr>
						<td><form:label path="type">User Type</form:label></td>		
						<td>
							<form:select path="type">
								<option value="GP" selected>GP</option>
								<option value="Consultant" selected>Consultant</option>
								<option value="Admin" selected>Administrator</option>
							</form:select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="Submit"/>
					</tr>
				</table>
			</form:form>
		
			<div id="searchBody">
			<h4>Search Users</h4>
			<form:form method="POST" action="/mediapp/usersPanel/userSearchResults">
				<table>
					<tr>
						<td><form:label path="id">ID</form:label></td>
						<td><form:input path="id"/></td>
					</tr>
					<tr>
						<td><form:label path="name">Name</form:label></td>
						<td><form:input path="name"/></td>
					</tr>
					<tr>
						<td><form:label path="email">Email</form:label></td>
						<td><form:input path="email"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="Search"/>
					</tr>
				</table>
			</form:form>
			</div>
		</div>
	</div>
</div>
<hr>

<button onclick="hideView()">Try</button>
<button class="button" onclick="$('searchBody').toggle();">Show/Hide</button>

</div>

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>