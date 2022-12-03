<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit your session</title>
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
                        <a class="nav-link" aria-current="page" href="/dashboard">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/student/session/${student.id }">My Sessions</a>
                    </li>
                </ul>
                    <a href="/student/logout" class="logout">Logout</a>
            </div>
        </div>
    </nav>
    <main class="container">
		<h1 class="mt-4 text-center">Edit your session</h1>
		<form:form action="/student/session/edit/${updatedSession.id }" method="post" modelAttribute="updatedSession">
			<input type="hidden" name="_method" value="put">
			<form:errors path="startDate" class="fw-bold text-danger d-block"/>
        	<form:label path="startDate" for="startDate" class="form-label">Start Date</form:label>
        	<form:input path="startDate" type="date" class="form-control mb-3" id="startDate"/>
        	<form:errors path="endDate" class="fw-bold text-danger d-block"/>
        	<form:label path="endDate" for="endDate" class="form-label">End date</form:label>
        	<form:input path="endDate" type="date" class="form-control mb-3" id="endDate" />
        	
        	<form:input type="hidden" path="id" value="${updatedSession.id}"/>
        	<form:input type="hidden" path="student" value="${studentId}"/>
        	<form:input type="hidden" path="tutor" value="${tutors.id}"/>
        	<div class="text-center">
	        	<input type="submit" value="Confirm" class="btn btn-outline-dark">
        	</div>
        </form:form>
    </main>
</body>
</html>