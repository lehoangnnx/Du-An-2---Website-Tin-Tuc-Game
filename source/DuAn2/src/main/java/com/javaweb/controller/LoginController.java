package com.javaweb.controller;

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
	
}
