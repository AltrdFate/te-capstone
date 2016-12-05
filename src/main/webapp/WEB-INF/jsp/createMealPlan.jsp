<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
	<h2>Create a Meal Plan</h2>
	<p class="lead">Please use the form below to create a new meal
		plan. Don't worry if you don't have all the information handy - you
		can always modify the details later.</p>

	<c:url value="/createMealplan" var="formAction" />
	<form id="mealPlanForm" method="POST" action="${formAction}">

		<div>
			<label for="mealPlanDescription">Meal Plan Description:</label><br>
			<input type="text" id="mealPlanDescription"
				name="mealPlanDescription" placeholder="Description" />
		</div>

		<div>
			<h3>Monday</h3>
			<div class="meals">
				<h4>Breakfast</h4>
				<select name="recipeId" id="recipeChoice">
					<c:forEach var="recipe" items="${recipes}">
						<option value="${recipe.recipeId}">${recipe.recipeName}</option>
					</c:forEach>
					<option value="" selected>None</option>
				</select><br> +Add a Recipe
			</div>


			<div class="meals">
				<h4>Lunch</h4>
				<select name="recipeChoice" id="recipeChoice">
					<c:forEach var="recipe" items="${recipes}">
						<option value="${recipe.recipeId}">${recipe.recipeName}</option>
					</c:forEach>
				</select><br> +Add a Recipe
			</div>
			<div class="meals">
				<h4>Dinner</h4>
				<select name="recipeChoice" id="recipeChoice">
					<c:forEach var="recipe" items="${recipes}">
						<option value="${recipe.recipeId}">${recipe.recipeName}</option>
					</c:forEach>
				</select><br> +Add a Recipe
			</div>
		</div>
		<button style="" id="submitMealPlan" class="btn btn-primary">Submit</button>
	</form>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
