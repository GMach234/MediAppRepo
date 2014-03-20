<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<%@ page import="java.sql.*" %> 
	<%@ page import="java.io.*" %> 

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<title>MediApp Home</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css">
</head>
<body>

<%--   <%
String thing = "";
try{
	String connectionURL = "jdbc:mysql://localhost:3306/mediappdb";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "proj", "proj");
	if(!connection.isClosed())
		out.println("Success");

	String queryString = "Select * from users";
	PreparedStatement statement = connection.prepareStatement(queryString);
	ResultSet resultSet = statement.executeQuery();
	while(resultSet.next()) {
		out.println("from DB = " + resultSet.getString("name"));	
		thing = resultSet.getString("name");
	}
}
catch(Exception ex) {
	out.println("Failure");
}
String that = "hello";
%>
<%=thing %> --%> 


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
		<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading"><h4>Actions</h4></div>
					<div class="panel-body">
						<div class="list-group">
							<a class="list-group-item" id="createClinic" href="">Create Clinic</a>
							<a class="list-group-item" id="searchClinic" href="">Search Clinics</a>
						</div>
					</div>
			</div>
		</div>
		<div class="col-md-9">
				<div id="createForm">
					<div class="panel panel-default">
						<div class="panel-heading"><h4>Create Clinic</h4></div>
							<div class="panel-body">
								<form:form method="POST" action="/mediapp/clinicsPanel/addClinic">
										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Country</span>
											<form:input path="country" style="width: 250px;" type="text" class="form-control"/>
										</div>

										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Province</span>
											<form:input path="province" style="width: 250px" type="text" class="form-control"/>
										</div>
										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Town</span>
											<form:input path="town" style="width: 250px" type="text" class="form-control"/>
										</div>
										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Adress</span>
											<form:input path="address" style="width: 250px" type="text" class="form-control"/>
										</div>
										<hr>
										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Name</span>
											<form:input path="name" style="width: 250px" type="text" class="form-control"/>
										</div>
										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Phone</span>
											<form:input path="phone" style="width: 250px" type="text" class="form-control"/>
										</div>
										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Email</span>
											<form:input path="email" style="width: 250px" type="text" class="form-control"/>
										</div>
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
				<div class="panel panel-default">
					<div class="panel-heading"><h4>Search Clinics</h4></div>
						<div class="panel-body">
								<form:form method="POST" action="/mediapp/clinicsPanel/clinicSearchResults">
									<div class="input-group">
										<span style="width: 100px;" class="input-group-addon">Country</span>
										<form:input path="country" style="width: 250px;" type="text" class="form-control"/>
									</div>
									<div class="input-group">
										<span style="width: 100px;" class="input-group-addon">Province</span>
										<form:input path="province" style="width: 250px" type="text" class="form-control"/>
									</div>
									<div class="input-group">
										<span style="width: 100px;" class="input-group-addon">Town</span>
										<form:input path="town" style="width: 250px" type="text" class="form-control"/>
									</div>
									<div class="input-group">
										<span style="width: 100px;" class="input-group-addon">Name</span>
										<form:input path="name" style="width: 250px" type="text" class="form-control"/>
									</div>
									<hr>
									<div class="btn-group">
										<input type="submit" class="btn btn-default" value="Submit"/>
									</div>
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
	$('#createClinic').on('click', function(event){
		event.preventDefault();
		$('#searchForm').hide();
		$('#createForm').show();
	});
	$('#searchClinic').on('click', function(event){
		event.preventDefault();
		$('#createForm').hide();
		$('#searchForm').show();
	});
});
</script>
</body>
</html>