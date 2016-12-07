package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import com.techelevator.model.RecipeDAO;

@Controller
@SessionAttributes("currentUser")
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
		String username = (String) session.getAttribute("currentUser");
		List<Recipe> recipeLibrary = recipeDao.viewRecipesByUserId(username);
		model.put("recipes", recipeLibrary);
		
		return "createMeal";
	}
	
	@Transactional
	@RequestMapping(path="/createMeal", method=RequestMethod.POST)
	public String submitCreateMealPage(HttpSession session,
										ModelMap model,
										Meal meal) {
		String username = (String) session.getAttribute("currentUser");
		//List<Recipe> recipeLibrary = recipeDao.viewRecipesByUserId(username);
		//model.put("recipes", recipeLibrary);
		mealDao.createMeal(meal, username);
		return "redirect:/createMeal";
	}
	
	@Transactional
	@RequestMapping(path="/modifyMeal", method=RequestMethod.GET)
	public String showModifyMealPage(HttpSession session,
										ModelMap model,
										Meal meal, @RequestParam Long mealId) {
		String username = (String) session.getAttribute("currentUser");
		List<Recipe> recipeLibrary = recipeDao.viewRecipesByUserId(username);
		model.put("recipeLibrary", recipeLibrary);
		String mealName = mealDao.displayMealName(mealId);
		ArrayList<Recipe> recipes = mealDao.displayRecipesInMeal(mealId);
		model.put("mealName", mealName);
		model.put("recipesInMeal", recipes);
		return "modifyMeal";
	}
	
	@Transactional
	@RequestMapping(path="/modifyMeal", method=RequestMethod.POST)
	public String submitModifiedMealPage(HttpSession session,
										ModelMap model,
										Meal meal, @RequestParam Long mealId) {
		String username = (String) session.getAttribute("currentUser");
		mealDao.modifyMeal(meal, mealId);
		return "redirect:/createMealPlan";
	}
}
