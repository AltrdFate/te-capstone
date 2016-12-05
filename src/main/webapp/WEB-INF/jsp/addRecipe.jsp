<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="main-box">
<h2>Add a Recipe</h2>
	<p class="lead">Please use the form below to add a new recipe to your library. Don't worry if you don't have all the information handy - you can always modify the details later.</p>
	<c:url value="/addRecipe" var="formAction"/>
	<form id ="recipeForm" method="POST" action="${formAction}">

			<div>
				<label for="recipeName">Recipe Name:</label><br>
				<input type="text" id="recipeName" name="recipeName" placeholder="Recipe Name"/>
			</div>
			
			<div>
				<label for="description">Description:</label><br>
				<input type="text" id="description" name="description" placeholder="Describe your recipe in 140 characters or less."/>
			</div>
			
			<div>
				<label for="ingredients">Ingredients:</label><br>
				<c:forEach var="i" begin="1" end="3">
					<p><input type="text" id="ingredients" name="ingredients" 
					placeholder="Ingredient"/></p>
				</c:forEach>
				<div id="extraIngredients"></div>
				<div id="addIngredient">+Add Ingredient</div><p>
			</div>
			
			<div>
				<label for="directions">Directions:</label><br>
				<ol id ="extraDirections"><c:forEach var="i" begin="1" end="3">
					<p><li><input type="text" id="directions" id="steps" name="directions"
					placeholder="Direction"/></li><p>
				</c:forEach>
				</ol>
				<p><div id="addDirection">+Add Direction</div><p>
			</div>
			<br>
			<p>
			<button type="submit" id="createRecipeButton" class="btn btn-primary">Submit</button>
			</p>
			
		</form>
</div> 
	
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
