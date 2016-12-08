package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.GroceryListDAO;
import com.techelevator.model.MealPlanDAO;

@Controller
@SessionAttributes("currentUser")
public class GroceryListController {

	private GroceryListDAO groceryDao;
	private MealPlanDAO mealPlanDao;
	
	@Autowired 
	public GroceryListController(GroceryListDAO groceryDao, MealPlanDAO mealPlanDao) {
		this.groceryDao = groceryDao;
		this.mealPlanDao = mealPlanDao;
	}
	
	@RequestMapping(path="/groceryList", method=RequestMethod.GET)
	public String displayGroceryListPage(HttpSession session,
										 ModelMap model, 
										 @RequestParam Long mealPlanId) {
		List<String> groceries = groceryDao.getAllIngredientsByMealPlanId(mealPlanId);
		model.put("groceries", groceries);
		return "groceryList";
	}
}
