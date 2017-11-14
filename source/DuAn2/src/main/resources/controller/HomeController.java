package com.javaweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.javaweb.model.Roles;
import com.javaweb.service.RolesServiceImpl;

@RestController
public class HomeController {
	@Autowired
	RolesServiceImpl rolesServiceImpl;
	
	@RequestMapping("/home")
	List<Roles> home() {
		return (List<Roles>) rolesServiceImpl.findAll() ;
	}
	@GetMapping("/home1")
	public String home1(@RequestParam("name") String name ) {
		System.out.println("Name" + name);
		return "Name :" + name ;
	}
	
	@RequestMapping("/login")
	String login() {
		return "login";
	}



}
