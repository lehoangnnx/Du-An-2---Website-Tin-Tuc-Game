package com.javaweb.controller;

import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaweb.repository.UsersRepository;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class UsersController {
	@Autowired
	UsersRepository usersRepository;

	//Lấy tất cả người dùng - trả về trang users
	@GetMapping("/users")
	public String users(Model model) {
		List<Users> listUsers = usersRepository.findAll();
		for (Roles r : listUsers.get(0).getRoleses()) {
			r.getName();
		}
		model.addAttribute("listUsers",listUsers);
		return "users";
	}
}
