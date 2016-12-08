package com.techelevator.model;

import java.util.ArrayList;
import java.util.HashMap;

public interface MealPlanDAO {
	
	public void createMealPlan(MealPlan mealPlan, String username);

	public MealPlan getMealPlan(Long mealPlanId);
	
	public ArrayList<MealPlan> getAllMealPlansByUserId(String username);
}
