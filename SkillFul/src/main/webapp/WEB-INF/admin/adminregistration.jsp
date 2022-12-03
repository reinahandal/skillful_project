<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Registration Page</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/loginreg.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container my-5 login-reg p-5">
		<h1 class="text-center">Admin Registration</h1>
		<p class="text-danger small"><form:errors path="user.*"/></p>
		<form:form method="POST" action="/registration" modelAttribute="user">
			<div class="mb-3">
				<form:label path="username" class="form-label">Username:</form:label>
				<form:input path="username" class="form-control"/> 
			</div>
			
			<div class="mb-3">
				<form:label path="password" class="form-label">Password:</form:label>
				<form:password path="password" class="form-control"/>
			</div>
			
			<div class="mb-3">
				<form:label path="passwordConfirmation" class="form-label">Confirm Password:</form:label>
				<form:password path="passwordConfirmation" class="form-control"/>
			</div>
			
			 <div class="d-grid gap-2">
             	<input type="submit" value="Register" class="btn btn-dark btn-lg shadow-sm rounded mt-3">
             </div>
		</form:form>
	</div>
</body>
</html>