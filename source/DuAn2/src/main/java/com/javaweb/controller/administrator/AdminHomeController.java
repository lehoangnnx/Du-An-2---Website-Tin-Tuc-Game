package com.javaweb.controller.administrator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaweb.service.UsersService;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	@Autowired
	UsersService usersService;
	/*Phương thức Get hiển thi trang index
	* Đường đẫn : /admin/index
	* Trả Về : Tên index trong file layout-administrator-tiles.xml cấu hình Apache Tiles
	*/
	@GetMapping("/index")
	public String index(Authentication authentication, HttpSession session) {
		if (authentication != null) {
			System.out.println("VAO DAY");
			System.out.println(authentication.getAuthorities());
			session.setAttribute("user", usersService.findByUserName(authentication.getName()));
			
		}
		return "index";
	}
	
	
}
