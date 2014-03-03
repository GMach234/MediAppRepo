<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h2>Clinics</h2>

<table cellspacing="150" class="horizontalRuled">

	<c:forEach items="${clinics}" var="clinic">
		
		<form action="/mediapp/clinicsPanel/showClinic/${clinic.id}">
			<p>Name: ${clinic.name}</p>
			<p>ID: ${clinic.id}</p>
			<p>Country: ${clinic.country}</p>
			<p>Province: ${clinic.province}</p>
			<p>Town: ${clinic.town}</p>
			<p>Phone: ${clinic.phone}</p>
			<p>Email: ${clinic.email}</p>
			<br>
			<br>
		<button type="submit">View</button>
		</form>
		
	</c:forEach>
</table>

</body>
</html>