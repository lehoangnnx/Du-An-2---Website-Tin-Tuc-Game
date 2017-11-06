package com.javaweb.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaweb.model.Users;
import com.javaweb.service.PagesService;
import com.javaweb.service.RolesService;
import com.javaweb.service.UsersService;

@Controller
public class HomeController {
	@Autowired
	RolesService rolesService;
	@Autowired
	PagesService pagesService;
	@Autowired
	UsersService usersService;
	
	
	@RequestMapping(value = {"/", "/home"})
	public String index(Principal p , Authentication authentication) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username= "";
		String quyen = "";
		
		if (principal instanceof UserDetails) {
		     username = ((UserDetails) principal).getUsername();
		     quyen = ((UserDetails) principal ).getAuthorities().toString();
		} else {
		     username = principal.toString();}
		// authentication.getAuthorities()
		  System.out.println("USER NAME NE :"+ username +"--" + "QUYEN NE : "+ quyen + "QUYEN 1 : ");
		/*UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		System.out.println("User has authorities: " + userDetails.getAuthorities());*/
		
		return "home";
	}
	/*@ModelAttribute("user")
	public Users user(Principal principal) {
		Users user = usersService.findByUserName(principal.getName());
		return user;
		
		
	}*/
	@RequestMapping("/chitiet")
	String chitiet() {
		return "chitiet";
	}
	
	@RequestMapping("/403")
	String error() {
		return "403";
	}
	
	
}
