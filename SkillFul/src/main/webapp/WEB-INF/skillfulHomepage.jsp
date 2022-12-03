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
<title>Skillful</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/navbarCSS.css">
	<link rel="stylesheet" href="/css/home.css">
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
                <li class="nav-item dropdown">
                     <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                          <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/student/login">Login as a student</a></li>
                                <li><a class="dropdown-item" href="/tutor/login">Login as a tutor</a></li>
                          </ul>
                 </li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
    	<div class="mt-5 px-3 image-div">
	    	<div class="me-4">
		    	<h1>Learning a new skill has never been easier!</h1>
		    	<h3 class="mt-5">Join us now and start learning!</h3>
		    	<div class="text-center">
			    	<a href="/student/register" class="btn btn-outline-dark btn-lg mt-5">Join us</a>
		    	</div>
	    	</div>
	    	<img src="<c:url value="/images/guitarlesson.jpg"/>" alt="guitar lesson" class="lesson-img"/>
    	</div>
    	<div class="my-5 px-3 image-div">
    	<img src="<c:url value="/images/tutorlesson.jpg"/>" alt="guitar lesson" class="lesson-img"/>
    	<div class="ms-4">
	    	<h1>Do you have a skill you would like to teach or knowledge you would like to share?</h1>
	    	<h3 class="mt-5">Join us and start teaching!</h3>
	    	<div class="text-center">
		    	<a href="/tutor/register" class="btn btn-outline-dark btn-lg mt-5">Join us</a>
	    	</div>
    	</div>
    	</div>
    </main>
</body>
</html>