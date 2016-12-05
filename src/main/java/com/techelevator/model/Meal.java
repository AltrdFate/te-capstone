package com.techelevator.model;

import java.util.ArrayList;

public class Meal {
	
	private Long mealId;
	private Long userId;
	private String mealDescription;
	private ArrayList<Long> recipeIds;
	
	public Long getMealId() {
		return mealId;
	}
	public void setMealId(Long mealId) {
		this.mealId = mealId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getMealDescription() {
		return mealDescription;
	}
	public void setMealDescription(String mealDescription) {
		this.mealDescription = mealDescription;
	}
	public ArrayList<Long> getRecipeIds() {
		return recipeIds;
	}
	public void setRecipeIds(ArrayList<Long> recipeIds) {
		this.recipeIds = recipeIds;
	}


}
