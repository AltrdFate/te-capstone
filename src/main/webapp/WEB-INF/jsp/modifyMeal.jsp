<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
	<h1>View/Modify Meal Details</h1>
	<p class="lead">
		Hey ${currentUser}!, Switch recipes in and out of your meal.
	<c:url value="/modifyMeal?mealId=${param.mealId}"
			var="formAction"/>
<form id="modifyMealForm" method="POST" action="${formAction}">
	<c:set value="${mealName}" var="mealName" />
	<p>${mealName}</p>
	<div class="formField">
				<label for="mealName">Meal Name:</label><br>
				<input type="text" id="mealName" name="mealDescription" value="${mealName}" placeholder="Meal Name"/>
	</div>
	<c:forEach var="i" begin="1" end="5">
		<p>	${recipesInMeal[i-1].recipeName}</p>
		<select name="recipeIds" id="recipeChoice">
			<c:forEach var="recipe" items="${recipeLibrary}">
				<option value="${recipe.recipeId}" >${recipe.recipeName}</option>
			</c:forEach>
				<option value="" selected>None</option>
			</select>
			</c:forEach>
			<br>
			<br>
			<p>
			<button type="submit" id="modifyMealButton" class="btn btn-primary">Submit</button>
			</p>
	</form>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />