package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.Recipe;
import com.techelevator.model.RecipeDAO;

@Controller
@SessionAttributes("currentUser")
public class RecipeController {
	
	private RecipeDAO recipeDao;
	
	@RequestMapping(path="/addRecipe", method=RequestMethod.GET)
	public String displayAddRecipePage(HttpSession session) {
		session.getAttribute("currentUser");
		return "addRecipe";
	}
	
	@Transactional
	@RequestMapping(path = "/addRecipe", method = RequestMethod.POST)
	public String addRecipeToLibrary(HttpSession session, Recipe recipe) {
		recipeDao.save(recipe);
		return "redirect:/recipeLibrary";
	}
	
	@RequestMapping (path = "/recipeLibrary", method = RequestMethod.GET) 
	public String displayRecipeLibraryPage(HttpSession session) {
		return "recipeLibrary";
	}
	

}
