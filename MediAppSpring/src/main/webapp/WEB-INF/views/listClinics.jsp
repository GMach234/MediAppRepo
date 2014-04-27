<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>MediApp Clinic Search</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css">
</head>
<body>

<div class="container">
	<h1><a href="<c:url value="/usersPanel"/>">MediApp Control Panel <span class="badge"> User: <sec:authentication property="principal.username"/></span></a></h1>

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
	        <li><a href="<c:url value="/usersPanel"/>">User Panel</a></li>
	        <li class="active"><a href="<c:url value="/clinicsPanel"/>">Clinic Panel</a></li>
	        <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
<!-- End NavBar -->	

<!-- Content -->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading"><h4>Clinic Search Results</h4></div>
					<div class="panel-body">
					
						<table class="table table-bordered table-striped table-hover table-responsive">
							<thead><tr><th>ID</th><th>Name</th><th>Country</th><th>Province</th><th>Town</th><th>Email</th><th></th></tr></thead>
								<c:forEach items="${clinics}" var="clinic">
									<tr>
									<td>${clinic.id}</td><td>${clinic.name}</td><td>${clinic.country}</td><td>${clinic.province}</td><td>${clinic.town}</td><td>${clinic.email}</td>
									<td>
									<form action="/MediAppSpring/clinicsPanel/showClinic/${clinic.id}">
									<button type="submit" class="btn btn-primary btn-block">View Clinic</button>
									</form>
									</td>
									</tr>
								</c:forEach>
						
						</table>
					</div>	
			</div>
		</div>		
	</div>
<hr>
</div>
<!-- End Content -->

</body>
</html>