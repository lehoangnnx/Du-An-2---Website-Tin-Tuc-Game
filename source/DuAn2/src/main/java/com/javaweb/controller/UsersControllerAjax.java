package com.javaweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.model.Users;

@RestController
@RequestMapping("/admin")
public class UsersControllerAjax {
	
	@PostMapping("/validator-user")
	public String validatorUser(@RequestBody Users users) {
		
		return "Thành Công Ajax";
	}
}
