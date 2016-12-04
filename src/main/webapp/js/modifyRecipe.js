$(document).ready(function() {
	
	$("#addIngredient").click(function(){
	    $("<p><input type='text' id='ingredients' name='ingredients' placeholder='Direction'/><p>").appendTo("#extraIngredients");
	});
	
	$("#addDirection").click(function(){
		$("<li><input type='text' id='directions' name='directions' placeholder='Direction'/></li><p>").appendTo("#extraDirections");
	});
	
});	