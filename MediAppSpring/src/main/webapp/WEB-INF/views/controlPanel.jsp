<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>MediApp Home</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.css"/>" type="text/css">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>" type="text/css">
</head>
<body>

<div class="container">
	<h1><a href="#">MediApp Control Panel</a></h1>


<div class="panel panel-default">
  <div class="panel-body">
    Basic panel example
  </div>
</div>

<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<ul class="nav">
				<li><a href="/mediapp/usersPanel">Users Panel</a></li>
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
		</ul>
	</div>
	<div class="span8">
		<div class="hero-unit">	
		</div>
	</div>
	
</div>
<hr>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>