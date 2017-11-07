package com.javaweb.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String index(Principal p , Authentication authentication, HttpSession session) {
		
		
		if (authentication != null) {
			System.out.println("VAO DAY");
			session.setAttribute("user", usersService.findByUserName(authentication.getName()));
			
		}
		
		System.out.println("GET SESSION :"+session.getAttribute("user"));
		return "home";
	}
	@RequestMapping("/chitiet")
	String chitiet() {
		return "chitiet";
	}
	
	@RequestMapping("/403")
	String error() {
		return "403";
	}
	
	
}
