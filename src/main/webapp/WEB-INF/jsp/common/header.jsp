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
<script src="/capstone/js/modifyRecipe.js"></script>
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
			<c:url var="homepageURL" value="/dashboard"/>
			<c:url var="logoutURL" value="/login"/>
			<li><a href="${homepageURL}">Home</a></li>
			<li><a href="${logoutURL}">Logout</a></li>
		</ul>
	</nav>
	</div>
</div>
	<section>