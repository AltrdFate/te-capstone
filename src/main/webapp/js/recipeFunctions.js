$(document).ready(function() {
	
	var counterIng = 0;
	$("#addIngredient").click(function(){
		if(counterIng <= 22) {
			$("<p><input type='text' id='ingredients' name='ingredients' placeholder='Ingredient'/><p>").appendTo("#extraIngredients");
			counterIng++;
		}
		else {
			alert("Join mealPlan PREMIUM to add more than 25 ingredients to your recipe.")
		}
	});
	
	var counterDir = 0;
	$("#addDirection").click(function(){
		if (counterDir <= 22) {
			$("<li><input type='text' id='directions' name='directions' placeholder='Direction'/></li><p>").appendTo("#extraDirections");
			counterDir++;
		}
		else {
			alert("Join mealPlan PREMIUM to add more than 25 direction steps to your recipe.")
		}
	});
	
	$("#recipeForm").validate({
		rules: {
			recipeName: {
				required: true,
			},
			description: {
				maxlength: 140
			}
			
		}
	});
	
//	var counterRecipe = 0;
//	$("#addRecipeToMeal").click(function(){
//		if (counterRecipe <= 4) {
//			$("<div class='mealForm'><select name='recipeIds' id='recipeChoice'><c:forEach var='recipe' items='${recipes}'>" +
//					"<option value='${recipe.recipeId}'>${recipe.recipeName}</option>" +
//				"</c:forEach>" +
//				"<option value='' selected>None</option>").appendTo("#mealForm");
//			counterRecipe++;
//		}
//		else {
//			alert("Join mealPlan PREMIUM to add more than 25 recipes to one meal.")
//		}
//	});
	
});	