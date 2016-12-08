package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public interface MealDAO {
	
	public void createMeal(Meal meal, String username);
	
	public String displayMealName(Long mealId);
	
	public ArrayList<Recipe> displayRecipesInMeal(Long mealId);
	
	public void modifyMeal(Meal meal, Long mealId);
	
	public ArrayList<Meal> viewAllMealsByUserId(String username);

	public void insertEmptyMeal(String username);

}
