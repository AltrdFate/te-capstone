package com.techelevator.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.model.UserDAO;

@Controller
@SessionAttributes("currentUser")
public class UserController {
	
	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm() {
			return "newUser";
	}
	@Transactional
	@RequestMapping(path="/users/new", method=RequestMethod.POST) 
	public String createUser(@RequestParam String username, @RequestParam String password) {
		userDAO.saveUser(username, password);
		return "/login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.GET) 
	public String goToLoginPage() {
		return "login";
	}
	
/*	@RequestMapping(path="/login", method = RequestMethod.POST)
	public String login(Map<String, Object> model, 
						@RequestParam String username, 
						@RequestParam String password, 
						@RequestParam(required = false) String destination,
						HttpSession session) {
		if (userDAO.searchForUsernameAndPassword(username, password)) {
			session.invalidate();
			model.put("currentUser", username);
			if(isValidRedirect(destination)) {
				return "redirect:"+destination;
			}else {
				return "redirect:/dashboard";
			}
		}else {
			return "redirect:/login";	
		}	
	}
	
	private boolean isValidRedirect(String destination) {
		return destination != null && destination.startsWith("http://localhost");
	}*/
	
	
//	@RequestMapping(path="/users/{userName}", method=RequestMethod.GET)
//	public String displayDashboard(Map<String, Object> model, @PathVariable String userName) {
//		return "userDashboard";
//	}
}
