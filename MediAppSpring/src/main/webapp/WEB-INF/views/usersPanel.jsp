<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<title>MediApp Home</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css">

	<style>
	.input-group-addon {
    min-width:100px;
    text-align:left;
	}
	</style>

</head>
<body>

<div class="container">
	<h1><a href="/mediapp/controlPanel">MediApp Control Panel <span class="badge"> User ID: <sec:authentication property="principal.username"/></span></a></h1>

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
	        <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
<!-- End NavBar -->	

<!-- Content -->
	<div class="row">
		<div class="col-md-3">
			<div class="panel panel-primary">
				<div class="panel-heading"><h4>Actions</h4></div>
					<div class="panel-body">
						<div class="list-group">
							<a class="list-group-item" id="createUser" href="">Create User</a>
							<a class="list-group-item" id="searchUser" href="">Search Users</a>
						</div>
					</div>
			</div>
		</div>
		<div class="col-md-9">
			<div id="createForm">
				<div class="panel panel-success">
				<div class="panel-heading"><h4>Create User</h4></div>
					<div class="panel-body">
						<form:form method="POST" action="/mediapp/usersPanel/addUser" modelAttribute="User">
							<div class="input-group">
								<span class="input-group-addon">Name</span>
								<form:input path="name" type="text" class="form-control"/>
							</div>
							<form:errors path="name" class="label label-warning"></form:errors>							
							<div class="input-group">
								<span class="input-group-addon">Address</span>
								<form:input path="address"  type="text" class="form-control"/>								
							</div>
							<form:errors path="address" class="label label-warning"></form:errors>
							<div class="input-group">
								<span class="input-group-addon">Phone</span>
								<form:input path="phone" type="text" class="form-control"/>
							</div>
							<form:errors path="phone" class="label label-warning"></form:errors>
							<div class="input-group">
								<span class="input-group-addon">Email</span>
								<form:input path="email" type="text" class="form-control"/>								
							</div>
							<form:errors path="email" class="label label-warning"></form:errors>
							<div class="input-group">
								<span class="input-group-addon">Password</span>
								<form:input path="password"  type="password" class="form-control"/>								
							</div>
							<form:errors path="password" class="label label-warning"></form:errors>
							<hr>							
							<div class="btn-group">
							  <form:radiobutton path="type" label="Administrator" class="btn btn-default" value="Admin"></form:radiobutton>
							  <br>
							  <form:radiobutton path="type" label="GP" class="btn btn-default" value="GP"></form:radiobutton>
							  <br>
							  <form:radiobutton path="type" label="Consultant" class="btn btn-default" value="Consultant"></form:radiobutton>
							</div>
							<form:errors path="type" class="label label-warning"></form:errors>
									
							<hr>
							<div class="btn-group">
								<input type="submit" class="btn btn-default" value="Submit"/>
								<input type="reset" class="btn btn-default" value="Reset"/>
							</div>							
						</form:form>
					</div>
				</div>
			</div>
		
			<div id="searchForm" style="display:none;">			
			<div class="panel panel-success">
				<div class="panel-heading"><h4>Search Users</h4></div>
					<div class="panel-body">
						<form:form method="POST" action="/mediapp/usersPanel/userSearchResults" modelAttribute="User">
							<div class="input-group">
								<span class="input-group-addon">Name</span>
								<form:input path="name" type="text" class="form-control"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon">ID</span>
								<form:input path="id" type="text" class="form-control"/>
							</div>
							<div class="input-group">
								<span class="input-group-addon">Email</span>
								<form:input path="email" type="text" class="form-control"/>
							</div>
							<hr>
							<div class="btn-group">
								<input type="submit" class="btn btn-default" value="Search"/>
								<input type="reset" class="btn btn-default" value="Reset"/>
							</div>	
						</form:form>
						<hr>
						<form:form method="POST" action="/mediapp/usersPanel/showAllUsers" modelAttribute="Clinic">
							<input type="submit" class="btn btn-default" value="View All Users"/>
						</form:form>
						
					</div>
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