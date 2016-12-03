package com.techelevator.controller;

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

import com.techelevator.model.Directions;
import com.techelevator.model.Ingredients;
import com.techelevator.model.Recipe;
import com.techelevator.model.RecipeDAO;

@Controller
@SessionAttributes("currentUser")
public class RecipeController {
	
	private RecipeDAO recipeDao;
	
	@Autowired
	public RecipeController(RecipeDAO recipeDao) {
		this.recipeDao = recipeDao;
	}
	
	@RequestMapping(path="/addRecipe", method=RequestMethod.GET)
	public String displayAddRecipePage(HttpSession session) {
		session.getAttribute("currentUser");
		return "addRecipe";
	}
	
	@Transactional
	@RequestMapping(path = "/addRecipe", method = RequestMethod.POST)
	public String addRecipeToLibrary(ModelMap model,  
									Recipe recipe,
									HttpSession session) {
		String username = (String) session.getAttribute("currentUser");
		recipeDao.save(recipe, username);
		return "redirect:/recipeLibrary";
	}
	
	@RequestMapping (path = "/recipeLibrary", method = RequestMethod.GET) 
	public String displayRecipeLibraryPage(HttpSession session, ModelMap model) {
			String username = (String) session.getAttribute("currentUser");
			List<Recipe> recipeLibrary = recipeDao.viewRecipesByUserId(username);
			model.put("recipeLibrary", recipeLibrary);
		return "recipeLibrary";
	}
	
	@RequestMapping (path = "/recipeDetails", method = RequestMethod.GET)
	public String displayRecipeDetailsPage(HttpSession session,
			ModelMap model, @RequestParam Long recipeId) {
			model.addAttribute("recipe", recipeDao.getRecipeById(recipeId));
			model.addAttribute("ingredients", recipeDao.getIngredientsByRecipeId(recipeId));
			model.addAttribute("directions", recipeDao.getDirectionsByRecipeId(recipeId));
			return "recipeDetails";
	}
	
	@RequestMapping(path="/modifyRecipeDetails", method = RequestMethod.GET) 
	public String displayModifyRecipeDetailsPage(HttpSession session, 
												ModelMap model, 
												@RequestParam Long recipeId) {
		model.addAttribute("recipe", recipeDao.getRecipeById(recipeId));
		model.addAttribute("ingredients", recipeDao.getIngredientsByRecipeId(recipeId));
		model.addAttribute("directions", recipeDao.getDirectionsByRecipeId(recipeId));
		return "modifyRecipeDetails";
	}
	
	@Transactional
	@RequestMapping(path="/modifyRecipeDetails", method = RequestMethod.POST)
	public String processRecipeModifications(HttpSession session,
											 ModelMap model, 
											 Recipe recipe, 
											 @RequestParam Long recipeId) {
		recipeDao.modifyRecipe(recipe, recipeId);
		return "redirect:/recipeDetails?recipeId="+recipeId;
	}
	
	
	
	
	
	
	
}
