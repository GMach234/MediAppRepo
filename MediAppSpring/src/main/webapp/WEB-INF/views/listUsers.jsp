<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html">
<html>
<head>
	<meta charset="utf-8">
	<title>MediApp Home</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css">
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
		
			<h4>Search Results</h4>
			
			<c:forEach items="${users}" var="user">
			<form action="/mediapp/usersPanel/showUser/${user.id}">
				<div class="well">
					<div class="panel panel-default">
						<div class="panel-heading">Name: ${user.name}</div>
							<div class="panel-body">
								<table class="table">
									<tbody>
										<tr>
											<td>ID: ${user.id}</td>
											<td>Type: ${user.type}</td>
										</tr>
										<tr>
											<td>Email: ${user.email}</td>
											<td>Phone: ${user.phone}</td>
										</tr>
									</tbody>
								</table>
							</div>
					</div>
					<button type="submit">View User</button>
				</div>
			</form>
			</c:forEach>				
		
	</div>
	
</div>
<hr>
</div>

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>