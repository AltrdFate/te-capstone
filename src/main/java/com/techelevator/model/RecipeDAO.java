package com.techelevator.model;

public interface RecipeDAO {
	
	public Recipe viewRecipesByUserId(Long id);
	
	public void addRecipeToLibrary(Recipe recipe);
	
//	public void createRecipe(String recipeName, Long recipeId, Long userId, String description,
//			String ingredients, String directions);
	
	public void save(Recipe recipe);
	
}
