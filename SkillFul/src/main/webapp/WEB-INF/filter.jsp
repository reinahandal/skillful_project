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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/navbarCSS.css">
	<link rel="stylesheet" href="/css/filter.css">
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
    <main class="mx-5">
	  <h3 class="mt-5 mb-4">What would you like to learn?</h3>
	  <form action="/search" method="post" style="width:100%">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="row">
				<div class="col-5">
					<input name="search" class="form-control" placeholder="Search by subject"/>
				</div>
				<div class="col-2">
					<select name="location" id="location" class="form-select">
						<option value="None">Location</option>	  
						<option value="0">Ramallah</option>
						<option value="1">Nablus</option>
						<option value="2">Jenin</option>
						<option value="3">Hebron</option>
						<option value="4">Tulkarm</option>
						<option value="5">Bethlehem</option>
						<option value="6">Qalqilya</option>
						<option value="7">Tubas</option>
						<option value="8">Jericho</option>
						<option value="9">Jerusalem</option>
						<option value="10">Gaza</option>				
					</select> 
				</div>
				<div class="col-2">
					<select name="level" id="level" class="form-select">
							<option value="All">Level</option>	  
							<option value="0">Beginner</option>
							<option value="1">Intermediate</option>
							<option value="2">Advanced</option>
							<option value="3">All levels</option>
					</select> 
				</div>
				<div class="col">
					<input type="submit" class="btn btn-dark" value="Search">
				</div>
			</div>
		</form>
		<div class="container results mt-5">
		    <c:forEach var="skill" items="${skills}">
		    	<div class="card">
	                <div class="card-body">
	                    <h5 class="card-title mb-3"><c:out value="${skill[0]}"></c:out> <c:out value="${skill[1]}"></c:out></h5>
	                    <h6 class="card-subtitle mb-3">Teaches ${skill[3]}</h6>
	                    <a href="/tutor/profile/${skill[2]}/${skill[3]}" class="card-link">See profile</a>
	                </div>
	            </div>
		    </c:forEach>
		</div>
    </main>	
</body>
</html>