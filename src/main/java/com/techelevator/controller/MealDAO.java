package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;

public interface MealDAO {
	
	public void createMeal(Meal meal, String username);
	
	public String displayMealName(Long mealId);
	
	public ArrayList<Recipe> displayRecipesInMeal(Long mealId);

}
