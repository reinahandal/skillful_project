<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Tutor Login</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/loginreg.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
	<main>
	    <img src="<c:url value="/images/project_logo.png"/>" alt="logo" class="logo mt-4"/>	
		<div class="container my-5 login-reg p-5">
            <h1 class="text-center">Tutor Login</h1>
            <form:form action="/tutor/login" method="post" modelAttribute="newLogin">
                <div class="mb-3">
                    <form:label for="login-email" path="email" class="form-label">Email</form:label>
                    <p class="text-danger small"><form:errors path="email"/></p>
                    <form:input type="text" path="email" id="login-email" class="form-control"/>             
                </div>
                <div class="mb-3">
                    <form:label for="login-pw" path="password" class="form-label">Password</form:label>
                    <p class="text-danger small"><form:errors path="password"/></p>
                    <form:input type="password" path="password" id="login-pw" class="form-control"/>             
                </div>
                <div class="d-grid gap-2">
                    <input type="submit" value="Login" class="btn btn-dark btn-lg shadow-sm rounded mt-3">
                </div>
            </form:form>
        </div>
	</main>
</body>
</html>