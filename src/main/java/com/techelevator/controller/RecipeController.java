package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.Recipe;

@Controller
@SessionAttributes("currentUser")
public class RecipeController {
	
	@RequestMapping(path="/addRecipe", method=RequestMethod.GET)
	public String displayAddRecipePage(HttpSession session) {
		session.getAttribute("currentUser");
		return "addRecipe";
	}
	
	@RequestMapping(path = "/addRecipe", method = RequestMethod.POST)
	public String addRecipeToLibrary(HttpSession session, Recipe recipe) {
		
	}
	

}
