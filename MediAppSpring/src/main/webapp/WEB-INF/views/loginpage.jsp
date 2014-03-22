<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>

<meta charset="utf-8">
	<title>MediApp Login</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css">

<style>
.margin-base-vertical {
        margin: 50px 0;
    }
.input-group-addon {
    min-width:100px;// if you want width please write here //
    text-align:left;
}
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body onload='document.f.j_username.focus();'>	

<div class="container">	
<div class="col-md-3"></div>	

<div class="col-md-6 margin-base-vertical">
	<h2 class="margin-base-vertical">Mediapp Login</h2>
		<div class="jumbotron">	
			<div class="well">  	
				<form name='f' method="POST" action="<c:url value='/j_spring_security_check' />">
					<div class="input-group">
						<span class="input-group-addon">User ID</span>
						<input type='text' name='j_username' value='' class="form-control">
					</div>
					<div class="input-group">
						<span class="input-group-addon">Password</span>
						<input type='password' name='j_password' class="form-control">
					</div>
					<hr>
					<div class="btn-group">
						<input type="submit" class="btn btn-default" value="Login"/>
						<input type="reset" class="btn btn-default" value="Reset"/>
					</div>
				</form>
			
				<c:if test="${not empty error}">
				<div class="alert alert-danger alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  			<strong>Error: </strong> ${error}
				</div>
				</c:if>
			</div>
		</div>
</div>  
 <div class="col-md-3"></div>
</div>	
	
	
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	
</body>
</html>