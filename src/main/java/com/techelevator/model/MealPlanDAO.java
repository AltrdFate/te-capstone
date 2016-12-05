package com.techelevator.model;

import java.util.ArrayList;

public interface MealPlanDAO {
	
	public void createMealPlan(ArrayList<Long> recipeIds);
	
	public void createMeal(Meal meal);

}
