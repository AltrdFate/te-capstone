<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Meal Planner-omatic 7000</title>
<c:url value="/css/bootstrap.min.css" var="bootstrapHref" />
<c:url value="/css/mealplanner.css" var="cssHref" />
<link href="stylesheet" href="${bootstrapHref}">
<link href="stylesheet" href="${cssHref}">
</head>

<body>
	<header><h1 class="mainTitle">Family Meal Planner</h1></header>
	<nav>
		<ul>
			<c:url var="loginURL" value="/login" />
			<c:url var="signupURL" value="/users/new" />
			<li><a href="${loginURL}">Login</a></li>
			<li><a href="${signupURL}">Sign up</a></li>
		</ul>
	</nav>
	
<section class="container-fluid">