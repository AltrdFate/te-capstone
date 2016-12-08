<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
	<h1>Modify Meal Details</h1>
	<p class="lead">
		Hey ${currentUser}! Here you can switch recipes in and out of your
		meal.
		<c:url value="/modifyMeal?mealId=${param.mealId}" var="formAction" />
	<div class="formField">
		<form id="modifyMealForm" method="POST" action="${formAction}">
			<c:set value="${mealName}" var="mealName" />

			<label for="mealName">Meal Name:</label><br> <input type="text"
				id="mealName" name="mealDescription" value="${mealName}"
				placeholder="Meal Name" />
			<p>
			<c:forEach var="i" begin="1" end="5">
					<br><p>Current Recipe: <c:out value="${recipesInMeal[i-1].recipeName}"/><br>
				
				<select name="recipeIds" id="recipeChoice">
					<c:forEach var="recipe" items="${recipeLibrary}">
						<option value="${recipe.recipeId}">${recipe.recipeName}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select>
				<p>
			</c:forEach>
			<br> 
			<p>
				<button type="submit" id="modifyMealButton" class="btn btn-primary">Submit</button>
			</p>
			<c:url value="/mealLibrary" var="mealLibraryURL"/>
			<a href="${mealLibraryURL}">Cancel</a>
		</form>
	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />