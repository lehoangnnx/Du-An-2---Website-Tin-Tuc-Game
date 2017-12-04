/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp AdminUsersRestController thực thi xử lý quản lý  người dùng bằng Ajax
* */
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
	// Kiểm tra email bị trùng
	public String validatorUser(@RequestBody Users user) {
		
	
		String error = "";
		try {
			Users u = usersService.findByEmail(user.getEmail());
			
			if(u == null || u.getUserId().equals(user.getUserId())) {
				error = "successemail";
				
			}else {

				error = "erroremail";
				
			}
			
		} catch (Exception e) {

			error = "successemail";
			System.out.println(e.getMessage());
			
		}
		return error;
	} 
}
