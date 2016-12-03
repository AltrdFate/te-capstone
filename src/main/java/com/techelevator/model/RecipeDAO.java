package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public interface RecipeDAO {
	
	public List<Recipe> viewRecipesByUserId(String username);
	
	public void save(Recipe recipe, String username);
	
	public Recipe getRecipeById(Long recipeId);
	
	public ArrayList<String> getIngredientsByRecipeId(Long recipeId);
	
	public ArrayList<String> getDirectionsByStepId(Long recipeId);
	
	public ArrayList<String> getDirectionsByRecipeId(Long recipeId);
	
	public Recipe modifyRecipe(Recipe recipe, Long recipeId);
	
}
