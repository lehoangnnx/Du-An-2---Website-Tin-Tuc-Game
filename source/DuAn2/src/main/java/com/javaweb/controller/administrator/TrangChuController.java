package com.javaweb.controller.administrator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class TrangChuController {

	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
}
