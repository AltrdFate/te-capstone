package com.techelevator.controller;

import java.util.List;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;

public interface MealDAO {
	
	public void createMeal(Meal meal, String username);

}
