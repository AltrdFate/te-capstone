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
import com.techelevator.model.MealDAO;
import com.techelevator.model.MealPlan;
import com.techelevator.model.MealPlanDAO;
import com.techelevator.model.RecipeDAO;

@Controller
@SessionAttributes("currentUser")
public class MealPlanController {
	
	private MealPlanDAO mealPlanDao;
	private MealDAO mealDao;
	private RecipeDAO recipeDao;
	
	@Autowired
	public MealPlanController(MealPlanDAO mealPlanDao, MealDAO mealDao, RecipeDAO recipeDao) {
		this.mealPlanDao = mealPlanDao;
		this.mealDao = mealDao;
		this.recipeDao = recipeDao;
	}
	
	@RequestMapping(path="/createMealPlan", method=RequestMethod.GET)
	public String displayCreateAMealPlanPage(HttpSession session,
											ModelMap model) {
		String username = (String) session.getAttribute("currentUser");
		List<Meal> mealLibrary = mealDao.viewAllMealsByUserId(username);
		model.put("meals", mealLibrary);
		return "createMealPlan";
	}
	
	@Transactional
	@RequestMapping(path="/createMealPlan", method=RequestMethod.POST)
	public String addMealPlanToLibrary(HttpSession session, 
										ModelMap model, MealPlan mealPlan) {
		String username = (String) session.getAttribute("currentUser");
		mealPlanDao.createMealPlan(mealPlan, username);
		return "redirect:/mealPlanLibrary";
	}
	
	@RequestMapping(path="/mealPlanDetails", method=RequestMethod.GET)
	public String displayMealPlanDetails(HttpSession session,
										ModelMap model,
										@RequestParam Long mealPlanId) {
		MealPlan mealPlan = mealPlanDao.getMealPlan(mealPlanId);
		model.put("mealPlan", mealPlan);
		ArrayList<Long> mealIds= mealPlan.getMealId();
		ArrayList<String> mealNames = new ArrayList<>();
		for(Long mealId:mealIds){
			String mealName = mealDao.displayMealName(mealId);
			mealNames.add(mealName);
		}
		model.put("mealNames", mealNames);
		return "mealPlanDetails";
	}
	
	@RequestMapping(path="/mealPlanLibrary", method=RequestMethod.GET)
	public String displayMealPlanLibraryPage(HttpSession session, ModelMap model) {
		String username = (String) session.getAttribute("currentUser");
		ArrayList<MealPlan> mealPlanList = mealPlanDao.getAllMealPlansByUserId(username);
		model.put("mealPlanList", mealPlanList);
		return "mealPlanLibrary";
	}

	@RequestMapping(path="/modifyMealPlan", method=RequestMethod.GET)
	public String viewModifyMealPlan(HttpSession session, 
								ModelMap model, 
								@RequestParam Long mealPlanId) {
		String username = (String) session.getAttribute("currentUser");
		MealPlan mealPlan = mealPlanDao.getMealPlan(mealPlanId);
		model.put("mealPlan", mealPlan);
		ArrayList<Long> mealIds= mealPlan.getMealId();
		ArrayList<String> mealNames = new ArrayList<>();
		for(Long mealId:mealIds){
			String mealName = mealDao.displayMealName(mealId);
			mealNames.add(mealName);
		}
		model.put("mealNames", mealNames);
		
		ArrayList<Meal> allMeals = mealDao.viewAllMealsByUserId(username);
		model.put("allMeals", allMeals);
		return "modifyMealPlan";
	}
	
	@Transactional
	@RequestMapping(path="/modifyMealPlan", method=RequestMethod.POST)
	public String submitModifiedMealPlan(HttpSession session, 
								@RequestParam Long mealPlanId) {
		mealPlanDao.deleteMealPlan(mealPlanId);
		return "redirect:/mealPlanLibrary";
	}
}
