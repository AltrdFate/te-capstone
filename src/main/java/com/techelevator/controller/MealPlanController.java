package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.MealPlanDAO;
import com.techelevator.model.Recipe;
import com.techelevator.model.RecipeDAO;

@Controller
@SessionAttributes("currentUser")
public class MealPlanController {
	
	private MealPlanDAO mealPlanDao;
	private RecipeDAO recipeDao;
	
	@Autowired
	public MealPlanController(MealPlanDAO mealPlanDao, RecipeDAO recipeDao) {
		this.mealPlanDao = mealPlanDao;
		this.recipeDao = recipeDao;
	}
	
	@RequestMapping(path="/createMealplan", method=RequestMethod.GET)
	public String displayCreateAMealPlanPage(HttpSession session,
											ModelMap model) {
		String username = (String) session.getAttribute("currentUser");
		List<Recipe> recipeLibrary = recipeDao.viewRecipesByUserId(username);
		model.put("recipes", recipeLibrary);
		return "createMealplan";
	}
	
	@Transactional
	@RequestMapping(path="/createMealplan", method=RequestMethod.POST)
	public String addMealPlanToLibrary(HttpSession session, 
										ModelMap model) {
		String username = (String) session.getAttribute("currentUser");
		
		return "redirect:/viewMealplan";
	}
}
