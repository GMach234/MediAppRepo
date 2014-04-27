<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MediApp Clinic</title>
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
	
	<div class="col-md-12">
		<div class="panel panel-primary">
			<div class="panel-heading"><h3>${clinic.name}</h3></div>
				<div class="panel-body">
					<div class="row">	
						<div class="col-md-6">
								 <div class="well">
								<ul class="list-group">
								 <li class="list-group-item">
								 <h4 class="list-group-item-heading">Details</h4>
    							 <p class="list-group-item-text">ID: ${clinic.id}<br>Name: ${clinic.name}</p>
								 </li>
								 <li class="list-group-item">
								 <h4 class="list-group-item-heading">Address</h4>
    							 <p class="list-group-item-text">${clinic.country}, ${clinic.province}, ${clinic.town}, ${clinic.address}</p>
								 </li>
								 <li class="list-group-item">
								 <h4 class="list-group-item-heading">Contact</h4>
    							 <p class="list-group-item-text">Email: ${clinic.email}<br>Phone Number: ${clinic.phone}</p>
								 </li>
								 <li class="list-group-item">
								 
								 <form:form action="/MediAppSpring/clinicsPanel/removeClinic/${clinic.id}" modelAttribute="Clinic">
<%-- 							  		<form:input path="id" type="hidden" name="remove" value="${clinic.id}"/> --%>
									<input type="submit" class="btn btn-danger" value="Remove Clinic"/>
								</form:form>
								 
								 </li>								 								 
								 </ul>
								</div>
							</div>
					</div>
					<div class="row">
					<hr>
					<div class="col-md-12">
							<div class="panel panel-success">
							<div class="panel-heading">
							<h3 class="panel-title">Patients</h3>
							</div>
							
								<table class="table table-bordered table-striped">
									<thead>
									    <tr>
										  	<th>ID</th>
										  	<th>Name</th>
										  	<th>Age</th>
										  	<th>Address</th>
										  	<th>Phone</th>
										  	<th>Email</th>
									    </tr>
									 </thead>
									 
									 <%-- <c:forEach items="${clinics}" var="clinic">
									 	<tr>
									  	<td>${clinic.id}</td>
									  	<td>${clinic.name}</td>
									  	<td>${clinic.country}</td>
									  	<td>${clinic.province}</td>
									  	<td>${clinic.town}</td>
									  	<td>${clinic.phone}</td>
									  	<td>${clinic.email}</td>
									  	<td>
									  	<form:form method="GET" action="/mediapp/clinicsPanel/showClinic/${clinic.id}">
											<input type="submit" value="View"/>
										</form:form>
									  	</td>
									  	<td>
									  	<form:form action="/mediapp/usersPanel/removeAssociation/${clinic.id}" modelAttribute="User">
									  		<form:input path="id" type="hidden" name="remove" value="${user.id}"/>
											<input type="submit" value="Remove Association"/>
										</form:form>
									  	</td>
										</tr>	
									 </c:forEach> --%>
									 
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>	
		
</body>
</html>