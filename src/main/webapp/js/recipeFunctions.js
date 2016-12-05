$(document).ready(function() {
	
	$("#addIngredient").click(function(){
	    $("<p><input type='text' id='ingredients' name='ingredients' placeholder='Ingredient'/><p>").appendTo("#extraIngredients");
	});
	
	
	$("#addDirection").click(function(){
		var counter = 0;
		if (counter <= 5) {
			$("<li><input type='text' id='directions' name='directions' placeholder='Direction'/></li><p>").appendTo("#extraDirections");
			counter++;
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