<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
	<h1>Modify Recipe Details</h1>
	<p class="lead">
		Hey ${currentUser}! This looks tasty. You can also use the form
		below to edit existing details of your recipe or add additional
		ingredients or steps.
		<c:url value="/modifyRecipeDetails?recipeId=${param.recipeId}"
			var="formAction" />
	<form id="recipeForm" method="POST" action="${formAction}">
		<div class="formField">
			<label for="recipeName">Recipe Name:</label><br> <input type="text"
				id="recipeName" name="recipeName" value="${recipe.recipeName}" />
		</div>
		<div class="formField">
			<label for="description">Description:</label><br> <input type="text"
				id="description" name="description" value="${recipe.description}" />
		</div>
		<div class="formField">
			<h4>Ingredients</h4>
			<c:forEach items="${ingredients}" var="ingredient">
				<p>
					<input type="text" id="ingredients" name="ingredients"
						value="${ingredient}" />
				<p>
			</c:forEach>
			<div id="extraIngredients"></div>
			<div id="addIngredient">+Add Ingredient</div>
		</div>
		<div class="formField">
			<h4>Directions</h4>
			<ol id="extraDirections">
				<c:forEach items="${directions}" var="direction">
					<li><p>
							<input type="text" id="directions" name="directions"
								value="${direction}" /></li>
				</c:forEach>

			</ol>

			<p>
			<div id="addDirection">+Add Direction</div>
			</p>
		</div>
		<button type="submit" id="editRecipeButton" class="btn btn-primary">Submit
			Changes</button>
	</form>
	<c:url value="/recipeDetails?recipeId=${recipe.recipeId}"
		var="recipeDetailsURL" />
	<a href="${recipeDetailsURL}">Cancel</a>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />