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

import com.techelevator.model.MealDAO;
import com.techelevator.model.UserDAO;

@Controller
@SessionAttributes("currentUser")
public class UserController {
	
	private UserDAO userDAO;
	private MealDAO mealDAO;

	@Autowired
	public UserController(UserDAO userDAO, MealDAO mealDAO) {
		this.userDAO = userDAO;
		this.mealDAO = mealDAO;
	}
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayLoginPageAsHomePage() {
		return "login";
	}
	
	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm() {
			return "newUser";
	}
	
	@Transactional
	@RequestMapping(path="/users/new", method=RequestMethod.POST) 
	public String createUser(@RequestParam String username, @RequestParam String password) {
		userDAO.saveUser(username, password);
		//mealDAO.insertEmptyMeal(username);
		return "redirect:/login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.GET) 
	public String goToLoginPage() {
		return "login";
	}
	
	@RequestMapping(path="/login", method = RequestMethod.POST)
	public String login(ModelMap model, 
						@RequestParam String username, 
						@RequestParam String password, 
						@RequestParam(required = false) String destination,
						HttpSession session) {
		if (userDAO.searchForUsernameAndPassword(username, password)) {
			session.invalidate();
			model.put("currentUser", username);
			//return "redirect:/dashboard";
			if(isValidRedirect(destination)) {
				return "redirect:"+destination;
			}else {
				return "redirect:/dashboard";
			}
		}else {
			return "redirect:/login";	
		}	
	}
	
	@RequestMapping(path="/dashboard", method=RequestMethod.GET)
	public String displayDashboardPage() {
		return "dashboard";
	}
	
	private boolean isValidRedirect(String destination) {
		return destination != null && destination.startsWith("http://localhost");
	}
	
	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.removeAttribute("currentUser");
		return "redirect:/";
	}
	/*@RequestMapping(path="/addRecipe", method=RequestMethod.GET)
	public String displayAddRecipePage(HttpSession session) {
		session.getAttribute("currentUser");
		return "addARecipe";
	}*/
	
	
//	@RequestMapping(path="/users/{userName}", method=RequestMethod.GET)
//	public String displayDashboard(Map<String, Object> model, @PathVariable String userName) {
//		return "userDashboard";
//	}
}
