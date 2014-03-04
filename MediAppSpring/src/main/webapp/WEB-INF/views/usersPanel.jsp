<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
	<title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">	
</head>
<body>

<div class="container">
	<h1><a href="/mediapp/controlPanel">MediApp Control Panel</a></h1>

<!-- NavBar -->
	<nav class="navbar navbar-default" role="navigation">
	  <div class="container-fluid">		
	  
	  	<div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand">Panels</a>
	    	</div>
	  
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="/mediapp/usersPanel">User Panel</a></li>
	        <li><a href="/mediapp/clinicsPanel">Clinic Panel</a></li>
	        <li><a href="#">Logout</a></li>	
	      </ul>
	    </div>
	  </div>
	</nav>
<!-- End NavBar -->	

<!-- Content -->
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading"><h4>Actions</h4></div>
					<div class="panel-body">
						<ul class="nav nav-list">
							<li class="nav-header">Actions</li>
							<li class="active"><a id="createUser" href="">Create User</a></li>
							<li><a id="searchUser" href="">Search Users</a></li>
						</ul>
					</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="jumbotron">
				<div id="createForm">
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
			</div>
		
			<div id="searchForm" style="display:none;">
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
<!-- End Content -->	
</div>

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<script>
$(document).ready(function(){
	$('#createUser').on('click', function(event){
		event.preventDefault();
		$('#searchForm').hide();
		$('#createForm').show();
	});
	$('#searchUser').on('click', function(event){
		event.preventDefault();
		$('#createForm').hide();
		$('#searchForm').show();
	});
});
</script>
</body>
</html>