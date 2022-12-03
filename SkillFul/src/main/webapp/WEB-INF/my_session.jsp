<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>My sessions</title>
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
	<div class="container-md">
		<div class="d-flex justify-content-between align-items-center my-4">
			<div>
				<h1>My Sessions</h1>
			</div>
			
		</div>
		<table class="table">
			<thead>
			    <tr>
			      <th scope="col">Tutor Name</th>
			      <th scope="col">Start Date</th>
			      <th scope="col">End Date</th>
			      <th scope="col">Location</th>
			      <th scope="col">Action</th>
			      
			    </tr>
		    </thead>
		    <tbody>
		  		<c:forEach var="session" items="${mySession}">
		  		<tr>
		  		<td scope="row"> ${session.getTutor().firstName} </td>
			      <td scope="row"><fmt:formatDate type="both"  pattern="dd MMMMM, yyyy" value="${session.startDate}"/></td>
			      <td><fmt:formatDate type="both"  pattern="dd MMMMM, yyyy" value="${session.endDate}"/></td>
			      <td>${session.getTutor().getTutorProfile().location}</td>
			      <td><a href="/student/delete/${session.id}">Delete </a> | <a href="/student/sessoion/edit/${session.id}">Edit </a></td>
			    </tr>
		   		</c:forEach>
		  	</tbody>
		  </table>
	 </div>
   	  <script src="/webjars/jquery/jquery.min.js"></script>
   	  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 	
</body>
</html>