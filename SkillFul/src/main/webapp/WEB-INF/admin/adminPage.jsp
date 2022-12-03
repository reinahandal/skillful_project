<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>
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
                        <a class="nav-link" href="/student/session/${student.id }">Add Skill</a>
                    </li>
                </ul>
                    <a href="/logout" class="logout">Logout</a>
            </div>
        </div>
    </nav>
    <br>
    <div class="container-md">
		<div class="d-flex justify-content-between align-items-center my-3">
			<div>
			  <h1>Welcome, <c:out value="${currentUser.username}"></c:out>!</h1>
			  <br>
			
			</div>
			
		</div>
		<table class="table table-striped">
		  <h2>All Students</h2>
			<thead>
			    <tr>
			      <th scope="col">Student ID</th>
			      <th scope="col">Student First Name</th>
			      <th scope="col">Student Last Name</th>
			      <th scope="col">Student Email</th>
			    <!--   <th scope="col">Action</th> -->
			      
			    </tr>
		    </thead>
		    <tbody>
		  		 <c:forEach var="student" items="${students}">
		  		<tr>
		  			<td scope="row"> ${student.id} </td>
			      <td scope="row">${student.firstName} </td>
			      <td>${student.lastName}</td>
			      <td>${student.email}</td>
			      <%-- <td><a href="/delete/student/${student.id}">Delete </a></td> --%>
			    </tr>
		   		</c:forEach> 
		  	</tbody>
		  </table>
		  <br>
		  <table class="table table-striped">
		  <h2>All Tutors</h2>
			<thead>
			    <tr>
			      <th scope="col">Tutor ID</th>
			      <th scope="col">Tutor First Name</th>
			      <th scope="col">Tutor Last Name</th>
			      <th scope="col">Tutor Email</th>
<!-- 			      <th scope="col">Action</th>
 -->			      
			    </tr>
		    </thead>
		    <tbody>
		  		 <c:forEach var="tutor" items="${tutors}">
		  		<tr>
		  			<td scope="row"> ${tutor.id} </td>
			      <td scope="row">${tutor.firstName} </td>
			      <td>${tutor.lastName}</td>
			      <td>${tutor.email}</td>
			     <%--  <td><a href="/delete/tutor/${tutor.id}">Delete </a></td> --%>
			    </tr>
		   		</c:forEach> 
		  	</tbody>
		  </table>
	 </div>
  
    

</body>
</html>