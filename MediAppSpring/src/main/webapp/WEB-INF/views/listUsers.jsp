<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>MediApp User Search</title>
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
	        <li class="active"><a href="<c:url value="/usersPanel"/>">User Panel</a></li>
	        <li><a href="<c:url value="/clinicsPanel"/>">Clinic Panel</a></li>
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
				<div class="panel-heading"><h4>User Search Results</h4></div>
					<div class="panel-body">
						<table class="table table-bordered table-striped table-hover">
							<thead><tr><th>ID</th><th>Name</th><th>Type</th><th>Email</th><th></th></tr></thead>
								<c:forEach items="${users}" var="user">
									<tr>
									<td>${user.id}</td><td>${user.name}</td><td>${user.type}</td><td>${user.email}</td>
									<td>
									<form action="/MediAppSpring/usersPanel/showUser/${user.id}">
									<button type="submit" class="btn btn-primary btn-block">View User</button>
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
<!-- End Content -->
</div>

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>