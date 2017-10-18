package com.javaweb.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;
import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.RolesServiceImpl;

@RestController
public class HomeController {
	@Autowired
	RolesService rolesService;
	
	@RequestMapping("/home")
	List<Roles> home() {
		System.out.println("llllllllllllllllll"+(List<Roles>) rolesService.findAll());
		List<Roles> lr = rolesService.findAll();
		for(Roles r : lr) {
			System.out.println("Roles :" + r.getName() );
			for(Users s : r.getUserses()) {
				System.out.println("Usser :" + s.getUserName());
			}
			System.out.println("-------------------");
		}
		System.out.println(" VI Tri 0 :" + lr.get(0).getName());
		System.out.println(" VI Tri 0 :" + lr.get(0).getUserses().toString());
		System.out.println("====================");
		System.out.println(" VI Tri 0 :" + lr.get(1).getName());
		System.out.println(" VI Tri 0 :" + lr.get(1).getUserses().toString());
		List<String> s = new ArrayList<String>(); 
		s.add("123");
		s.add("123");
		s.add("123");
		System.out.println(s);
		
		Object[] ar = lr.toArray();
		
		System.out.println("MMMMMMM " + ar);
		
		String json = new Gson().toJson(s );
		System.out.println("Gson " + s);
		return  null ;
	}
	@GetMapping("/admin")
	public String home1(@RequestParam("name") String name ) {
		System.out.println("Name" + name);
		return "Name :" + name ;
	}
	
	@RequestMapping("/login")
	String login() {
		return "login";
	}

	@RequestMapping("/403")
	String error() {
		return "403";
	}

	
}
