<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Book a session</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/navbarCSS.css">
	<link rel="stylesheet" href="/css/forms.css">
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
                        <a class="nav-link" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">My Sessions</a>
                    </li>
                </ul>
                    <a href="/student/logout" class="logout">Logout</a>
            </div>
        </div>
    </nav>
	<main class="container">
		<h1 class="text-center mt-4">Book a Session</h1>
		<div class="tutor-form">
		<h5 class="my-3">Tutor: <c:out value="${tutors.firstName}"></c:out> <c:out value="${tutors.lastName}"></c:out></h5>
		<form:form action="/student/session/new" method="post" modelAttribute="newSession">
			<div class="mb-3">
			<form:errors path="startDate" class="fw-bold text-danger d-block"/>
        	<form:label path="startDate" for="startDate" class="form-label">Start Date</form:label>
        	<form:input path="startDate" type="date" class="form-control mb-3" id="startDate"/>
			</div>
			<div class="mb-3">
        	<form:errors path="endDate" class="fw-bold text-danger d-block"/>
        	<form:label path="endDate" for="endDate" class="form-label">End date:</form:label>
        	<form:input path="endDate" type="date" class="form-control mb-3" id="endDate" />
			</div>
        	<div class="mb-3">
        	<form:input type="hidden" path="student" value="${studentId}"/>
        	<form:input type="hidden" path="tutor" value="${tutors.id}"/>
        	</div>
        	<div class="text-center">
	        	<input type="submit" value="Confirm" class="btn btn-outline-dark mt-3">
        	</div>
        </form:form>
		</div>
      </main>
   	  <script src="/webjars/jquery/jquery.min.js"></script>
   	  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 	
</body>
</html>