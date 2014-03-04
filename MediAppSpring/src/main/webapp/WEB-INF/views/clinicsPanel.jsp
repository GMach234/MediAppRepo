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

<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<ul class="nav">
				<li><a href="/mediapp/usersPanel">Users Panel</a></li>
				<li class="active"><a href="/mediapp/clinicsPanel">Clinics Panel</a></li>
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
			<li class="active"><a href="#">Create Clinic</a></li>
			<li><a href="#">Search Clinics</a></li>
		</ul>
	</div>
	<div class="span8">
		<div class="hero-unit">
			<h3>Create Clinic</h3>
			
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
			
			<hr>
			
			<h3>Search by Email/ID</h3>
			<form:form method="POST" action="/mediapp/clinicsPanel/clinicSearchResults">
				<table>
					<tr>
						<td><form:label path="id">ID</form:label></td>
						<td><form:input path="id"/></td>
					</tr>
					<tr>
						<td><form:label path="email">Email</form:label></td>
						<td><form:input path="email"/></td>
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
<hr>
</div>

<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>