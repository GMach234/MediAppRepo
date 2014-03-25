<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading"><h2>${user.name}</h2></div>
				<div class="panel-body">
					<div class="row">	
						<div class="col-md-6">
							<div class="panel panel-default">
							<div class="panel-heading">
							<h3 class="panel-title">Details</h3>
							</div>
								<div class="panel-body">
								 <ul class="list-group">
								 <li class="list-group-item">ID: ${user.id}</li>
								 <li class="list-group-item">Address: ${user.address}</li>
								 <li class="list-group-item">Phone: ${user.phone}</li>
								 <li class="list-group-item">Email: ${user.email}</li>
								 <li class="list-group-item">Type: ${user.type}</li>
								 </ul>
							  	</div>
							</div>
						</div> <!-- End col-md-6 -->
						<div class="col-md-6">
							<div class="panel panel-default">
							<div class="panel-heading">
							<h3 class="panel-title">Add Clinic Association</h3>
							</div>
								<div class="panel-body">
									<form:form method="POST" action="/mediapp/clinicsPanel/addAssociation" modelAttribute="Clinic">															
									<div>
										<select class="form-control" name = "country" id="selCountries" onchange="getProvinces()">
											<option value="0">Country</option>
										</select>
										<select class="form-control" name = "province" id="selProvinces" onchange="getTowns()">
											<option value="0">Province</option>
										</select>
										<select class="form-control" name = "town" id="selTowns" onchange="getNames()">
											<option value="0">Town</option>
										</select>
										<form:select path="name" class="form-control" name = "name" id="selNames">
											<form:option path="name" value="0">Name</form:option>
										</form:select>
									</div>

									<hr>
									<div class="btn-group">
										<input type="submit" class="btn btn-default" value="Submit"/>
										<input type="reset" class="btn btn-default" value="Reset"/>
									</div>	
								</form:form>
							  	</div>
							</div>
						</div> <!-- End col-md-6 -->
					</div>
					<div class="row">
					<hr>
					<div class="col-md-12">
							<div class="panel panel-default">
							<div class="panel-heading">
							<h3 class="panel-title">Clinics</h3>
							</div>
							
								<table class="table table-bordered table-striped">
									<thead>
									    <tr>
										  	<th>ID</th>
										  	<th>Name</th>
										  	<th>Country</th>
										  	<th>Province</th>
										  	<th>Town</th>
										  	<th>Phone</th>
										  	<th>Email</th>
									    </tr>
									 </thead>
									 <c:forEach items="${clinics}" var="clinic">
									 	<tr>
									  	<td>${clinic.id}</td>
									  	<td>${clinic.name}</td>
									  	<td>${clinic.country}</td>
									  	<td>${clinic.province}</td>
									  	<td>${clinic.town}</td>
									  	<td>${clinic.phone}</td>
									  	<td>${clinic.email}</td>
									  	<td><button type="submit">View Clinic</button></td>
									  	<td><button type="submit">Remove Association</button></td>
										</tr>	
									 </c:forEach> 							  
								</table>
							</div>
						</div> <!-- End col-md-6 -->
					</div>
				</div> <!-- End Panel Body -->
		</div> <!-- End Panel -->
	</div><!-- End col-md-12 -->		
<hr>
<!-- End Content -->
</div>


	
		
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>		
</body>
</html>