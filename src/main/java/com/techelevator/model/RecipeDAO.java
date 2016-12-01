package com.techelevator.model;

import java.util.List;

public interface RecipeDAO {
	
	public List<Recipe> viewRecipesByUserId(String username);
	
	public void save(Recipe recipe, String username);
	
	public Recipe getRecipeById(Long recipeId);
}
