package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.GroceryListDAO;

@Controller
@SessionAttributes("currentUser")
public class GroceryListController {

	private GroceryListDAO groceryDao;
	
	@Autowired 
	public GroceryListController(GroceryListDAO groceryDao) {
		this.groceryDao = groceryDao;
	}
	
	@RequestMapping(path="/groceryList", method=RequestMethod.GET)
	public String displayGroceryListPage(HttpSession session,
										 ModelMap model) {
		String username = (String) session.getAttribute("currentUser");
		List<String> groceries = groceryDao.getAllIngredientsByUserId(username);
		model.put("groceries", groceries);
		return "groceryList";
	}
}
