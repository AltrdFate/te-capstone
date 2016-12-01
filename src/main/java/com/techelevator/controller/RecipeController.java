package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	public String displayRecipeLibraryPage(HttpSession session) {
		return "recipeLibrary";
	}
}
