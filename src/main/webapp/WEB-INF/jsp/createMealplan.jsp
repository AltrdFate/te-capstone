<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
	<h2>Create a meal plan</h2>
		<p class="lead">Please use the form below to create a new meal plan. Don't worry if you don't have all the information handy - you can always modify the details later.</p>
	
	<c:url value="/createMealplan" var ="formAction"/>
	<form id="mealPlanForm" method="POST" action="${formAction}">
	
			<div>
				<label for="mealPlanDescription">Meal Plan Description:</label><br>
				<input type="text" id="mealPlanDescription" name="mealPlanDescription" placeholder="Description"/>
			</div>
			
			<div>
				<label for = "mondayRecipeChoice">Click on a recipe to add it to your meal plan for Monday</label>
			<select name="recipeChoice" id = "recipeChoice">
				<c:forEach var="recipe" items="${recipes}">
					<option value="${recipe.recipeName}">${recipe.recipeName}</option>
				</c:forEach>
				</select>
			</div>
			
			<div>
				<label for = "tuesdayRecipeChoice">Click on a recipe to add it to your meal plan for Tuesday</label>
			<select name="recipeChoice" id = "recipeChoice">
				<c:forEach var="recipe" items="${recipes}">
					<option value="${recipe.recipeName}">${recipe.recipeName}</option>
				</c:forEach>
				</select>
			</div>
			
			<div>
				<label for = "wednesdayRecipeChoice">Click on a recipe to add it to your meal plan for Wednesday</label>
			<select name="recipeChoice" id = "recipeChoice">
				<c:forEach var="recipe" items="${recipes}">
					<option value="${recipe.recipeName}">${recipe.recipeName}</option>
				</c:forEach>
				</select>
			</div>
			
			<div>
				<label for = "thursdayRecipeChoice">Click on a recipe to add it to your meal plan for Thursday</label>
			<select name="recipeChoice" id = "recipeChoice">
				<c:forEach var="recipe" items="${recipes}">
					<option value="${recipe.recipeName}">${recipe.recipeName}</option>
				</c:forEach>
				</select>
			</div>
			
			<div>
				<label for = "fridayRecipeChoice">Click on a recipe to add it to your meal plan for Friday</label>
			<select name="recipeChoice" id = "recipeChoice">
				<c:forEach var="recipe" items="${recipes}">
					<option value="${recipe.recipeName}">${recipe.recipeName}</option>
				</c:forEach>
				</select>
			</div>
			
			<div>
				<label for = "saturdayRecipeChoice">Click on a recipe to add it to your meal plan for Saturday</label>
			<select name="recipeChoice" id = "recipeChoice">
				<c:forEach var="recipe" items="${recipes}">
					<option value="${recipe.recipeName}">${recipe.recipeName}</option>
				</c:forEach>
				</select>
			</div>
			
			<div>
				<label for = "sundayRecipeChoice">Click on a recipe to add it to your meal plan for Sunday</label>
			<select name="recipeChoice" id = "recipeChoice">
				<c:forEach var="recipe" items="${recipes}">
					<option value="${recipe.recipeName}">${recipe.recipeName}</option>
				</c:forEach>
				</select>
			</div>
			
			













</form>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
