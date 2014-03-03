<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	<%@ page import="java.sql.*" %> 
	<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>New Clinic</h2>

<%
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
<%=thing %>


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

<h2>Search Clinic</h2>
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

<h2>Search by Email/ID</h2>
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

<form action="/mediapp/controlPanel">
<button type="submit">Control Panel</button>
</form>

</body>
</html>