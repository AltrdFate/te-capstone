package com.techelevator.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.UserDAO;

@Controller
public class NewUserController {
	
	private UserDAO userDAO;

	@Autowired
	public NewUserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm() {
			return "newUser";
	}
	
	@RequestMapping(path="/users", method=RequestMethod.POST) 
	public String createUser(@RequestParam String username, @RequestParam String password) {
		userDAO.saveUser(username, password);
		return "redirect:/login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.GET) 
	public String goToLoginPage() {
		return "login";
	}
	
//	@RequestMapping(path="/users/{userName}", method=RequestMethod.GET)
//	public String displayDashboard(Map<String, Object> model, @PathVariable String userName) {
//		return "userDashboard";
//	}
}
