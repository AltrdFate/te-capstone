package com.techelevator.model;

import java.util.ArrayList;

public interface MealPlanDAO {
	
	public void createMealPlan(MealPlan mealPlan, String username);
	
	public void createMeal(MealPlan mealPlan, Meal meal, String username);

}
