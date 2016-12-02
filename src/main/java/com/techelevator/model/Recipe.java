package com.techelevator.model;

import java.util.List;

public class Recipe {
	
	private String recipeName;
	private Long recipeId;
	private Long userId;
	private String description;
	private List<Ingredients> ingredients;
	private List<Directions> directions;
	
	public Long getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(Long recipeId) {
		this.recipeId = recipeId;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public List<Ingredients> getIngredients() {
		return ingredients;
	}
	public void setIngredients(List<Ingredients> ingredients) {
		this.ingredients = ingredients;
	}
	public List<Directions> getDirections() {
		return directions;
	}
	public void setDirections(List<Directions> directions) {
		this.directions = directions;
	}
}
