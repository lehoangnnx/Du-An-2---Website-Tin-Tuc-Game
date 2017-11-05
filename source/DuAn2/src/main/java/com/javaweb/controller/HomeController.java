package com.javaweb.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
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
		System.out.println(p.getName());
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		System.out.println("User has authorities: " + userDetails.getAuthorities());
		
		return "home";
	}
	@ModelAttribute("user")
	public Users user(Principal principal) {
		Users user = usersService.findByUserName(principal.getName());
		return user;
		
		
	}
	
	@RequestMapping("/403")
	String error() {
		return "403";
	}
	
	
}
