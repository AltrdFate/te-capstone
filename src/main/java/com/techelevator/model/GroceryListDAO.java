package com.techelevator.model;

import java.util.List;

public interface GroceryListDAO {
	
	public List<String> getAllIngredientsByMealPlanId(Long mealPlanId);

}
