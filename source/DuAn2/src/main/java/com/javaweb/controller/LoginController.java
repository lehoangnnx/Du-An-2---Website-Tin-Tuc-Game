package com.javaweb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class LoginController {

	@GetMapping("/login")
	String login(Model model, String error) {
		System.out.println("Loiiiiiiiiiiiiiiiiiiiiii : " +error);
		
		
		if (error != null) {
            model.addAttribute("error", "Tài Khoản Hoặc Mật Khẩu Không Đúng");
		}
		
		return "login";
	}
	
	@GetMapping(value="/logout")
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/";
	}
	
}
