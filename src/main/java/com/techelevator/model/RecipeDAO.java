package com.techelevator.model;

public interface RecipeDAO {
	
	public Recipe viewRecipesByUserId(Long id);
	
	public void addRecipeToLibrary(Recipe recipe);
	
	

}
