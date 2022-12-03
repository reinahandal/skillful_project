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
    <title>Your Profile</title>
	<link rel="stylesheet" href="/css/navbarCSS.css">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
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
    <main class="container-lg mt-5 tutorprofile">
		<div class="main-profile container">
			<div class="mb-5">
				<h3>About <c:out value="${tutorProfile.tutor.firstName}"></c:out></h3>
				<p><c:out value="${tutorProfile.tutorDescription}"></c:out></p>
			</div>
			<div class="mb-5">
				<h3>About the lesson</h3>
				<p><c:out value="${tutorProfile.lessonDescription}"></c:out></p>
			</div>
			<h3>Subjects</h3>
			<div>
				<table class="table table-bordered">
					<tr>
					<td>Subjects</td>
					<c:forEach var="subject" items="${profileSubjects}">
					<th>${subject.subject.title}</th>
					</c:forEach>
					</tr>
					<tr>
					<td>Levels</td>
					<c:forEach var="subject" items="${profileSubjects}">
					<td>${subject.level}</td>
					</c:forEach>
					</tr>
					<tr>
					<td>Hourly Rate</td>
					<c:forEach var="subject" items="${profileSubjects}">
					<td>${subject.hourlyRate} NIS</td>
					</c:forEach>
					</tr>
				</table>
			</div>
		</div>	
    	<div class="profile-sidebar text-center p-3" style="background-color:white">
			<h1><c:out value="${tutorProfile.tutor.firstName}"></c:out> <c:out value="${tutorProfile.tutor.lastName}"></c:out></h1>
			<p>Tutor since: <fmt:formatDate type="both"  pattern="dd MMMMM, yyyy" value="${tutorProfile.createdAt}"/></p>
			<p>Location: <c:out value="${tutorProfile.location}"></c:out></p>
			<c:if test="${tutorProfile.online == true}">
				<p class="online">Offers Online lessons</p>
			</c:if>
			<a href="/tutor/profile/${tutorProfile.id}/edit" style="color: black">Edit profile</a><br>
			<a href="/tutor/session/${tutorProfile.tutor.id }" style="color: black">My sessions</a>
    	</div>
    </main>
</body>
</html>
