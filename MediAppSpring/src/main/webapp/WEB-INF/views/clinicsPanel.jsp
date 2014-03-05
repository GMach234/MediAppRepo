<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	        <li class="active"><a href="/mediapp/clinicsPanel">Clinic Panel</a></li>
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
							<li class="active"><a id="createClinic" href="">Create Clinic</a></li>
							<li><a id="searchClinic" href="">Search Clinics</a></li>
						</ul>
					</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="jumbotron">
				<div id="createForm">
					<div class="panel panel-default">
						<div class="panel-heading"><h4>Create Clinic</h4></div>
							<div class="panel-body">

									<table>
									</table>

										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Country</span>
											<input type="text" class="form-control">
										</div>

										<div class="input-group">
											<span style="width: 100px;" class="input-group-addon">Province</span>
											<input type="text" class="form-control">
										</div>

							</div>
					</div>
			
					<form:form method="POST" action="/mediapp/clinicsPanel/addClinic">
						<table>
							<tr>
								<td><form:label path="country">Country</form:label></td>
								<td><form:input path="country"/></td>
							</tr>
							<tr>
								<td><form:label path="province">Province</form:label></td>
								<td><form:input path="province"/></td>
							</tr>
							<tr>
								<td><form:label path="town">Town</form:label></td>
								<td><form:input path="town"/></td>
							</tr>
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
								<td colspan="2">
									<input type="submit" value="Submit"/>
							</tr>
						</table>
					</form:form>
			</div>
		
			<div id="searchForm" style="display:none;">
			<h3>Search Clinics</h3>
				<form:form method="POST" action="/mediapp/clinicsPanel/clinicSearchResults">
					<table>
						<tr>
							<td><form:label path="country">Country</form:label></td>
							<td><form:input path="country"/></td>
						</tr>
						<tr>
							<td><form:label path="province">Province</form:label></td>
							<td><form:input path="province"/></td>
						</tr>
						<tr>
							<td><form:label path="town">Town</form:label></td>
							<td><form:input path="town"/></td>
						</tr>
						<tr>
							<td><form:label path="name">Name</form:label></td>
							<td><form:input path="name"/></td>
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