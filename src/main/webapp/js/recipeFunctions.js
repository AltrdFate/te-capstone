$(document).ready(function() {
	
	var counterIng = 0;
	$("#addIngredient").click(function(){
		if(counterIng <= 20) {
			$("<p><input type='text' id='ingredients' name='ingredients' placeholder='Ingredient'/><p>").appendTo("#extraIngredients");
			counterIng++;
		}
		else {
			alert("Join mealPlan PREMIUM to add more than 20 ingredients to your recipe.")
		}
	});
	
	var counterDir = 0;
	$("#addDirection").click(function(){
		if (counterDir <= 20) {
			$("<li><input type='text' id='directions' name='directions' placeholder='Direction'/></li><p>").appendTo("#extraDirections");
			counterDir++;
		}
		else {
			alert("Join mealPlan PREMIUM to add more than 20 ingredients to your recipe.")
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
	
});	