package com.javaweb.controller;

import com.javaweb.model.Users;
import com.javaweb.service.EmailService;
import com.javaweb.service.UsersService;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ForgotPasswordAjax {
	@Autowired
	UsersService usersService;
	@Autowired
	EmailService emailService;



	@PostMapping("/user/forgotpassword")

	public String forgotPassword(@RequestBody String userName, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Users users = null;
		try {
			users = usersService.findByUserName(userName);
			if (users == null) {
				return "error";
			} else {
				String random = randomString(20);
				String url = request.getScheme() + "://" +
			             request.getServerName() + ":" + request.getServerPort() +
			             request.getContextPath() + "/forgotpassword/" + random;
				emailService.sendSimpleMessage("nhungngaycobongem@gmail.com", "WebsiteGame24h.com - Password Reset",
						url);
				users.setForgotpassword(random);
				usersService.saveorupdate(users);
				String getEmail = users.getEmail();
				getEmail = getEmail.replace(getEmail.substring(3,10), "*******");
				return "* Vui Lòng Kiểm Tra Email " + getEmail;
			}
		} catch (Exception e) {
			return "error";
		}
	}

	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZzxcvbnmasdfghjklqwertyuiop";
	static Random rnd = new Random();

	String randomString(int len) {
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(AB.charAt(rnd.nextInt(AB.length())));
		return sb.toString();
	}
}
