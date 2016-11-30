<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Meal Planner-omatic 7000</title>

<c:url value="/css/bootstrap.min.css" var="bootstrapUrl" />
<c:url value="/css/mealplanner.css" var="cssUrl" />
<link rel="stylesheet" type="text/css" href="${bootstrapUrl}">
<link rel="stylesheet" type="text/css" href="${cssUrl}">

<script src="/capstone/js/jquery.min.js"></script>
<script src="/capstone/js/jquery.validate.min.js"></script>
<script src="/capstone/js/newUserValidation.js"></script>
<script
	src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
</head>

<body>
<div class="header">
<div class="title">
	<header>
		<p class="lead">mealPlan</p>
	</header>
	</div>
	<div class="nav">
	<nav>
		<ul>
			<c:url var="loginURL" value="/login" />
			<c:url var="signupURL" value="/users/new" />
			<li><a href="${loginURL}">Login</a></li>
			<li><a href="${signupURL}">Sign up</a></li>
		</ul>
	</nav>
	</div>
</div>
	<section>