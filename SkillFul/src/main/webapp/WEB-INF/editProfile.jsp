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
    <title>Edit Profile</title>
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
                        <a class="nav-link" aria-current="page" href="/tutor/profile/${TutorProfile.id }">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/tutor/session/${TutorProfile.tutor.id }">My Sessions</a>
                    </li>
                </ul>
                    <a href="/tutor/logout" class="logout">Logout</a>
            </div>
        </div>
    </nav>
    <main class="container mt-4">
    	<a href="/tutor/profile/${TutorProfile.id}" style="color:black">Back to profile</a>
    	<h1 class="text-center">Edit Your Profile</h1>
		<form:form action="/tutor/profile/${TutorProfile.id}/edit" method="post" modelAttribute="TutorProfile">
			<input type="hidden" name="_method" value="put">
			<div class="mb-3">
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
		        <form:errors path="tutorDescription" class="text-danger small"/>
		        <form:textarea path="tutorDescription" class="form-control" rows="5"/>
			</div>
			<div class="mb-3">
				<form:label path="lessonDescription" class="form-label">Tell us About Your Teaching Style and your typical lesson</form:label>
		        <form:errors path="lessonDescription" class="text-danger small"/>
		        <form:textarea path="lessonDescription" class="form-control" rows="5"/>
			</div>
			<form:input type="hidden" path="tutor" value="${tutorId}"/>
			<div class="text-center">
				<input type="submit" value="Update Profile" class="btn btn-outline-dark"/>
			</div>
		</form:form>
		<h3 class="mt-4 text-center">Edit Your Subjects</h3>	
		<a href="/tutor/profile/${TutorProfile.id}/subjects" class="small" style="color:#a846a0ff">Add Subject</a>
		<table class="table table-borderless">
			<tr>
				<th>Subject</th>
				<th>Level</th>
				<th>Hourly Rate</th>
				<th>Action</th>
			</tr>
			<c:forEach var="subject" items="${profileSubjects}">
			<tr>
				<td>${subject.subject.title}</td>
				<td>${subject.level}</td>
				<td>${subject.hourlyRate} NIS</td>
				<td>
					<form:form action="/tutor/${TutorProfile.id}/subject" method="post">
					<a href="/tutor/profile/${TutorProfile.id}/subject/${subject.id}/edit" style="color:#50514fff">Edit</a>
						<input type="hidden" name="_method" value="delete"/>
						<input type="hidden" name="subjectId" value="${subject.id}"/>
						<input type="submit" value="Delete" class="btn btn-link" style="color:#50514fff">
					</form:form>
				</td>
			</tr>
			</c:forEach>
		</table>
    </main>
</body>
</html>
