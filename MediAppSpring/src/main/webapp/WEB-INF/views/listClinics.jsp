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
	        <li><a href="/mediapp/usersPanel">User Panel</a></li>
	        <li class="active"><a href="/mediapp/clinicsPanel">Clinic Panel</a></li>
	        <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
<!-- End NavBar -->	

<!-- Content -->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading"><h4>Results</h4></div>
					<div class="panel-body">
						<c:forEach items="${clinics}" var="clinic">
							<form action="/mediapp/clinicsPanel/removeClinic/${clinic.id}">
								<ul class="list-group">
								  <li class="list-group-item list-group-item-success"><span class="badge">${clinic.id}</span>${clinic.name}</li>
								  <li class="list-group-item">Country: ${clinic.country}</li>
								  <li class="list-group-item">Province: ${clinic.province}</li>
								  <li class="list-group-item">Town: ${clinic.town}</li>
								  <li class="list-group-item">Phone: ${clinic.phone}</li>
								  <li class="list-group-item">Email: ${clinic.email}</li>
								  <li class="list-group-item"><button type="submit">Remove Clinic</button></li>
								</ul>
							</form>	
						</c:forEach>
					</div>	
			</div>
		</div>		
	</div>
<hr>
</div>
<!-- End Content -->

</body>
</html>