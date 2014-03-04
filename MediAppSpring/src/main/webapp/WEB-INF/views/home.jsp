<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

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
	        <li><a href="/mediapp/usersPanel">User Panel</a></li>
	        <li><a href="/mediapp/clinicsPanel">Clinic Panel</a></li>
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
							<li class="active"><a href="#">Create Clinic</a></li>
							<li><a href="#">Search Clinics</a></li>
						</ul>
					</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="jumbotron">
				<h4>Hello, world!</h4>
				<p>...blah blah blah blah...</p>
				<p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>
			</div>
		</div>
	</div>
<hr>
<!-- End Content -->	
</div>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>
