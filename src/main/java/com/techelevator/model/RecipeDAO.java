package com.techelevator.model;

import java.util.ArrayList;

public interface RecipeDAO {
	
	public Recipe viewRecipesByUserId(Long id);
	
	public void addRecipeToLibrary(Recipe recipe);
	
	public void createRecipe(String recipeName, Long recipeId, Long userId, String description,
			String ingredients, ArrayList<String> steps);
	
}
