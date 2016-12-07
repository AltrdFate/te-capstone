package com.techelevator.model;

import java.util.ArrayList;

public class MealPlan {
	
	private String mealPlanDescription;
	private Long mealPlanId;
	private Long userId;
	private ArrayList<Long> mealId;
	
	
	public String getMealPlanDescription() {
		return mealPlanDescription;
	}
	
	public void setMealPlanDescription(String mealPlanDescription) {
		this.mealPlanDescription = mealPlanDescription;
	}
	
	public Long getMealPlanId() {
		return mealPlanId;
	}
	
	public void setMealPlanId(Long mealPlanId) {
		this.mealPlanId = mealPlanId;
	}

	public ArrayList<Long> getMealId() {
		return mealId;
	}

	public void setMealId(ArrayList<Long> mealId) {
		this.mealId = mealId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
}
