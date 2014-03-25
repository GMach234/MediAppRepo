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

<h2>${clinic.name}</h2>

		<p>Name:: ${clinic.name}</p>
		<p>ID: ${clinic.id}</p>
		<p>Country: ${clinic.country}</p>
		<p>Province: ${clinic.province}</p>
		<p>Town: ${clinic.town}</p>
		<p>Phone: ${clinic.phone}</p>
		<p>Email: ${clinic.email}</p>
		<br>
		
</body>
</html>