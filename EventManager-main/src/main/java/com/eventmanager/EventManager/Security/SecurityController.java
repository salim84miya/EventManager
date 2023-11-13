package com.eventmanager.EventManager.Security;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eventmanager.EventManager.event.Event;

@Controller
public class SecurityController {

	private AuthentificationService authentication;
	
	public SecurityController(AuthentificationService authentication) {
		super();
		this.authentication = authentication;
	}
	
	
	@RequestMapping(value="login-page",method = RequestMethod.GET)
	public String gotologinPage () {
		return "login";
	}
	
	@RequestMapping(value="login-page",method = RequestMethod.POST)
	public String gotoLandingPage (@RequestParam String username,@RequestParam String password,ModelMap model) {
		
		if(authentication.authenticateAdmin(username, password)) {
			model.put("username",username);
			model.put("password",password);
			return "homepage";
		}
		return "login";
	}
	
	


	
	
}
