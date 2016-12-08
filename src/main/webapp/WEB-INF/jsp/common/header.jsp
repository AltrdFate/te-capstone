<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>mealPlan : Start Planning a Healthier You Today</title>

<c:url value="/css/bootstrap.min.css" var="bootstrapUrl" />
<c:url value="/css/mealplanner.css" var="cssUrl" />
<link rel="stylesheet" type="text/css" href="${bootstrapUrl}">
<link rel="stylesheet" type="text/css" href="${cssUrl}">
<script src="/capstone/js/jquery.min.js"></script>
<script src="/capstone/js/jquery.validate.min.js"></script>
<script src="/capstone/js/newUserValidation.js"></script>
<script src="/capstone/js/recipeFunctions.js"></script>
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
				<div class="dropdown">
					My Recipes <span class="caret"></span>
					<div class="dropdown-content">
					<c:url var="addRecipeURL"  value="/addRecipe" />
					<c:url var="viewRecipeLibraryURL" value="/recipeLibrary"/>
						<a href="${addRecipeURL}">Add a Recipe</a><p>
						<a href="${viewRecipeLibraryURL}">View Recipe Library</a>
					</div>
				</div>
				
				<div class="dropdown">
					My Meals <span class="caret"></span>
					<div class="dropdown-content">
					<c:url var="createMealURL" value="/createMeal"/>
						<a href="${createMealURL}">Create Meal</a><p>
					<c:url var="mealLibraryURL" value="/mealLibrary"/>
						<a href="${mealLibraryURL}">View Meal Library</a>
					</div>
				</div>
				
				<div class="dropdown">
					My Meal Plan <span class="caret"></span>
					<div class="dropdown-content">
					<c:url var="createMealPlanURL" value="/createMealPlan" />
							<a href="${createMealPlanURL}">Create Meal Plan</a><br>
							<c:url var="mealPlanLibraryURL" value="/mealPlanLibrary"/>
							<a href="${mealPlanLibraryURL}">View Meal Plan Library</a>
					</div>
				</div>
				
				
				<div class="dropdown">
					<c:url var="homepageURL" value="/dashboard" />
					<a href="${homepageURL}">Home</a>
				</div>
				
			</nav>
		</div>
		<div class="logoutButton">
			<c:url var="logoutURL" value="/logout"/>
			<form id="logoutForm" action="${logoutURL}" method="POST">
				<a href="${logoutURL}"><button type="submit" class="btn btn-outline-primary">Logout</button></a>
			</form>
		</div>
	</div>

<section>