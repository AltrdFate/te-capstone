package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Recipe {
	
	private String recipeName;
	private Long recipeId;
	private Long userId;
	private String description;
	private String[] ingredients;
	private String[] directions;
	
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
	public String[] getIngredients() {
		return ingredients;
	}
	public void setIngredients(String[] ingredients) {
//		List<Ingredients> ingredientList = new ArrayList<>();
//		for(Ingredients i: ingredients) {
//			ingredientList.add(i);
//		}
		this.ingredients = ingredients;
	}
	public String[] getDirections() {
		return directions;
	}
	public void setDirections(String[] directions) {
//		List<Directions> stepList = new ArrayList<>();
//		for(Directions d: directions) {
//			stepList.add(d);
//		}
		this.directions = directions;
	}
}
