<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>New User</h2>
<form:form method="POST" action="/mediapp/usersPanel/addUser">
	<table>
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
			<td><form:label path="password">Password</form:label></td>
			<td><form:input type="password" path="password"/></td>
		</tr>
		<tr>
			<td><form:label path="type">User Type</form:label></td>		
			<td>
				<form:select path="type">
					<option value="GP" selected>GP</option>
					<option value="Consultant" selected>Consultant</option>
					<option value="Admin" selected>Admin</option>
				</form:select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Submit"/>
		</tr>
	</table>
</form:form>

<h2>Search Users</h2>
<form:form method="POST" action="/mediapp/usersPanel/searchResults">
	<table>
		<tr>
			<td><form:label path="id">ID</form:label></td>
			<td><form:input path="id"/></td>
		</tr>
		<tr>
			<td><form:label path="name">Name</form:label></td>
			<td><form:input path="name"/></td>
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