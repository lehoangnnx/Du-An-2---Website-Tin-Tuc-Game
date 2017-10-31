package com.javaweb.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import com.javaweb.service.PagesService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;
import com.javaweb.model.Pages;
import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.RolesServiceImpl;

import javassist.expr.Cast;

@Controller
public class HomeController {
	@Autowired
	RolesService rolesService;
	@Autowired
	PagesService pagesService;
	
	@RequestMapping(value = {"/", "/home"})
	public String index( ) {
		
		
		return "home";
	}
	
	
	@RequestMapping("/403")
	String error() {
		return "403";
	}
	
	
}
