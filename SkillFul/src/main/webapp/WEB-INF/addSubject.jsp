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
    <title>What would you like to teach?</title>
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
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/tutor/profile/${tutorProfile.id }">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/tutor/session/${tutorProfile.tutor.id }">My Sessions</a>
                    </li>
                </ul>
                    <a href="/tutor/logout" class="logout">Logout</a>
            </div>
        </div>
    </nav>
   <main class="container">
		<h1 class="mt-4">Add a Subject you would like to teach: </h1>
		<form:form action="/tutor/profile/${tutorProfile.id}/subjects" method="post" modelAttribute="TutorProfileSubject">
			<div class="my-4">
				<form:select path="subject" class="form-select">
				<form:option value="">SELECT SUBJECT</form:option>
				<c:forEach var="subject" items="${subjects}">
				<form:option value="${subject.id}" label="${subject.title}"/>
				</c:forEach>
				</form:select>
			</div>
			<div class="mb-3">
				<form:label path="hourlyRate" class="form-label">Hourly Rate for this Subject</form:label>
				<form:errors path="hourlyRate" class="text-danger small"/>
				<form:input path="hourlyRate" class="form-control"/>
			</div>
			<div class="mb-3">
				<form:label path="level" class="form-label">The levels you want to teach</form:label>
				<form:select path="level" class="form-select">
				<form:errors path="level" class="text-danger small"/>
				<form:option value="">SELECT LEVEL</form:option>
				<form:options items="${levels}"/>
				</form:select>
			</div>
	   		<form:input type="hidden" path="tutorProfile" value="${tutorProfile.id}"/>
			<div class="text-center">
				<input type="submit" value="Submit" class="btn btn-dark"/>
				<a href="/tutor/profile/${tutorProfile.id}" class="btn btn-outline-dark">Done</a>
			</div>
		</form:form>
	</main>
</body>
</html>
