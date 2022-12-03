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
<meta charset="windows-1256">
<title>Contact ${tutor.firstName}</title>
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
                        <a class="nav-link" aria-current="page" href="/skillful">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/dashboard">Profile</a>
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
    	<div class="tutor-form">
		<h3 class="text-center my-4">Contact ${tutor.firstName} ${tutor.lastName}</h3>
		    <form action="/student/email/${tutor.id}" method="POST">
		        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		                        <div class="mb-3">
		                            <label for="name" class="form-label">Your name</label>
		                            <input type="text" id="name" name="name" class="form-control">
		                    	</div>
		                    <div class="mb-3">
		                            <label for="subject" class="form-label">Subject</label>
		                            <input type="text" id="subject" name="subject" class="form-control">
		                	</div>
		                        <div class="mb-3">
		                            <label for="message" class="form-label">Your message</label>
		                            <textarea  id="message" name="message" rows="3" class="form-control md-textarea"></textarea>
		                        </div>
		                <div class="d-grid gap-2 my-3">
						<input type="submit" class="btn btn-outline-dark my-4" value="Send">
		           		</div>
			</form>
			</div>
    </main>
</body>
</html>