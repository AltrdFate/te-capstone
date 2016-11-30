package com.techelevator.model;

import java.util.ArrayList;

public class Recipe {
	
	private String recipeName;
	private Long recipeId;
	private Long userId;
	private String description;
	private String ingredients;
	private ArrayList<String> steps;
	
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
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public ArrayList<String> getSteps() {
		return steps;
	}
	public void setSteps(ArrayList<String> steps) {
		this.steps = steps;
	}

}
