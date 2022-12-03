<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Create Tutor Profile</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/navbarCSS.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <nav class="navbar sticky-top navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <div class="logo">
                <img src="<c:url value="/images/project_logo.png"/>" alt="test"/>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/skillful">Home</a>
                    </li>
                </ul>
                    <a href="/tutor/logout" class="logout">Logout</a>
            </div>
        </div>
    </nav>
    <main class="container">
    	<h1 class="mt-4">Let's create your tutor profile</h1>
		<form:form action="/tutor/profile/create" method="post" modelAttribute="TutorProfile">
			<div class="my-4">
				<form:label path="location" class="form-label">Your Location</form:label>
				<form:select path="location" class="form-select">
					<form:option value="">SELECT LOCATION</form:option>
					<form:options items="${locations}"></form:options>
				</form:select>
			</div>
			<div class="mb-3 form-check">
				<form:checkbox path="online" value="true" id="checkbox" class="form-check-input"/>
				  <label class="form-check-label" for="checkbox">I want to teach online</label>
			</div>
			<div class="mb-3">
				<form:label path="tutorDescription" class="form-label">Tell us About Yourself</form:label>
		        <p><form:errors path="tutorDescription" class="text-danger small"/></p>
		        <form:textarea path="tutorDescription" class="form-control"/>
			</div>
			<div class="mb-3">
				<form:label path="lessonDescription" class="form-label">Tell us About Your Teaching Style and your typical lesson</form:label>
		        <p><form:errors path="lessonDescription" class="text-danger small"/></p>
		        <form:textarea path="lessonDescription" class="form-control"/>
			</div>
			<form:input type="hidden" path="tutor" value="${tutorId}"/>
			
			<div class="text-center">
			<input type="submit" value="Create Profile" class="btn btn-outline-dark"/>
			</div>
		</form:form>
    </main>
</body>
</html>