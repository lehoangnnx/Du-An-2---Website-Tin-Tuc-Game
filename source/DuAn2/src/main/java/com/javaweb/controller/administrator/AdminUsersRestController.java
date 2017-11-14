package com.javaweb.controller.administrator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.UsersService;

@RestController
@RequestMapping("/admin")
public class AdminUsersRestController {
	@Autowired
	UsersService usersService;
	@Autowired
	RolesService rolesService;
	
	@PostMapping("/validator-user")
	public String validatorUser(@RequestBody Users user) {
		
	
		String error = "";
		System.out.println("9999"+user.getEmail());
		try {
			Users u = usersService.findByEmail(user.getEmail());
			
			if(u.equals(null) || u.getUserId().equals(user.getUserId())) {
				System.out.println("SUCCESS");
				error = "successemail";
				
			}else {
				
				System.out.println("ERROR");
				error = "erroremail";
				
			}
			
		} catch (Exception e) {

			error = "successemail";
			System.out.println(e.getMessage());
			
		}
		
		return error;
	} 
}
