<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login Page</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/loginreg.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container my-5 login-reg p-5">
		<h1 class="text-center">Admin Login</h1>
		<c:if test="${logoutMessage != null}">
        	<c:out value="${logoutMessage}"></c:out>
    	</c:if>
<!--     	<h1 class="text-center">Login</h1> -->
    	<c:if test="${errorMessage != null}">
        	<p class="text-danger small"><c:out value="${errorMessage}"></c:out></p> 
    	</c:if>
    	<form method="POST" action="/login">
    		<label for="username" class="form-label">Username</label>
			<input type="text" id="username" name="username" class="form-control"/>
			
			<label for="password" class="form-label">Password</label>
			<input type="password" id="password" name="password" class="form-control"/>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<input type="submit" value="Login!" class="btn btn-dark btn-lg shadow-sm rounded mt-3"/>
    	</form>
	</div>    
</body>
</html>