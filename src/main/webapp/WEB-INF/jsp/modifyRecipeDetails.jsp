<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="main-box">
	<h1>Modify Recipe Details</h1>
	<c:url value="/modifyRecipeDetails?recipeId=${param.recipeId}"
		var="formAction" />
	<form id="recipeForm" method="POST" action="${formAction}">
		<label for="recipeName">Recipe Name:</label> <input type="text"
			id="recipeName" name="recipeName" value="${recipe.recipeName}" />
		<p>
			<label for="description">Description:</label> <input type="text"
				id="description" name="description" value="${recipe.description}" />
		<p>
		<h4>Ingredients</h4>
		<c:forEach items="${ingredients}" var="ingredient">
			<p>
				<input type="text" id="ingredients" name="ingredients"
					value="${ingredient}" />
			<p>
		</c:forEach>
		<div id="extraIngredients"></div>
		<div id="addIngredient">+Add Ingredient</div>
		<h4>Directions</h4>
		<ol id="extraDirections">
			<c:forEach items="${directions}" var="direction">
				<li><p>
						<input type="text" id="directions" name="directions"
							value="${direction}" /></li>
			</c:forEach>
			
		</ol>
		
		<p><div id="addDirection">+Add Direction</div></p>
		<p>
		<button type="submit" id="editRecipeButton" class="btn btn-primary">Submit
			Changes</button>
	</form>
	<c:url value="/recipeDetails?recipeId=${recipe.recipeId}" var="recipeDetailsURL"/>
	<a href="${recipeDetailsURL}">Cancel</a>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />