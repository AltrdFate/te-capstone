package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.RecipeDAO;

@Controller
@SessionAttributes
public class MealController {

	
	private RecipeDAO recipeDao;
	private MealDAO mealDao;
	
	@Autowired
	public MealController(RecipeDAO recipeDao, MealDAO mealDao) {
		this.recipeDao=recipeDao;
		this.mealDao=mealDao;
	}
	
	@RequestMapping(path="/createMeal", method=RequestMethod.GET)
	public String displayCreateMealPage(HttpSession session,
										ModelMap model) {
		return "createMeal";
	}
}
