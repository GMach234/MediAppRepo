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

<h2>Users</h2>


<table cellspacing="400" class="horizontalRuled">

	<c:forEach items="${users}" var="user">
		<p>Name: ${user.name}</p>
		<p>ID: ${user.id}</p>
		<p>Address: ${user.address}</p>
		<p>Phone: ${user.phone}</p>
		<p>Email: ${user.email}</p>
		<p>Type: ${user.type}</p>
		<br>
		<br>
	</c:forEach>
</table>


</body>
</html>