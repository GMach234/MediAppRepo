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

<h2>${user.name}</h2>

		<p>Name: ${user.name}</p>
		<p>ID: ${user.id}</p>
		<p>Address: ${user.address}</p>
		<p>Phone: ${user.phone}</p>
		<p>Email: ${user.email}</p>
		<p>Type: ${user.type}</p>
		<br>

		<form:form method="POST" action="/mediapp/usersPanel/removeUser">
			<form:label path="id"></form:label>
			<form:input path="id" type="hidden" value='${user.id}' />
			<input type="submit" value="Remove"/>
		</form:form>
		
		
		<h2>Add Clinic</h2>
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
		
			
</body>
</html>