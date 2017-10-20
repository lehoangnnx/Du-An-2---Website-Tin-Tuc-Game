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
	
	@RequestMapping("/home")
	List<Roles> home() {
		System.out.println("Đây là lấy dữ liệu 2 bảng"+  rolesService.findAll());
		System.out.println("Đây là lấy dữ liệu 1 bảng" + (List<Pages>) pagesService.findAll());
		List<Roles> lr =  rolesService.findAll();
		
		
//		for (int i = 0; i < lr.size(); i++) {
//			System.out.println("999999" + lr.get(i).getName());
//		}
//		for(Roles r : lr) {
//			System.out.println("Roles :" + r.getName() );
//			for(Users s : r.getUserses()) {
//				System.out.println("Usser :" + s.getUserName());
//			}
//			System.out.println("-------------------");
//		}
		System.out.println(" VI Tri 0 :" +lr);
//		System.out.println(" VI Tri 0 :" + lr.get(0).getUserses().toString());
//		System.out.println("====================");
//		System.out.println(" VI Tri 0 :" + lr.get(1).getName());
//		System.out.println(" VI Tri 0 :" + lr.get(1).getUserses().toString());
		List<String> s = new ArrayList<String>(); 
		s.add("123");
		s.add("123");
		s.add("123");
		System.out.println(s);
		
		Object[] ar = lr.toArray();
		
		System.out.println("MMMMMMM NNNNNNN AA" + ar);
		
//		String json = new Gson().toJson(s );
//		System.out.println("Gson " + s);
		return  rolesService.findAll() ;
	}
	@GetMapping("/admin")
	public String home1(@RequestParam("name") String name ) {
		System.out.println("Name" + name);
		return "Name :" + name ;
	}
	
	@GetMapping("/login")
	String login(Model model,String error) {
		System.out.println("Loiiiiiiiiiiiiiiiiiiiiii : " +error);
		if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");
		return "login";
	}

	@RequestMapping("/403")
	String error() {
		return "403";
	}
	@RequestMapping("/")
	String index(Model model,Principal principal1) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if (principal instanceof UserDetails) {
		   String  username = ((UserDetails) principal).getUsername();
		     System.out.println("555555555555 IF"+username );
		     System.out.println(((UserDetails) principal).getPassword());
		     System.out.println(((UserDetails) principal).isAccountNonLocked());
		     System.out.println(((UserDetails) principal).getAuthorities());
		} else {
			String  username = principal.toString();
		     System.out.println("555555555555 ELSE"+username );
		}
		model.addAttribute("username", principal1.getName());
		
		return "home";
	}
	
}
