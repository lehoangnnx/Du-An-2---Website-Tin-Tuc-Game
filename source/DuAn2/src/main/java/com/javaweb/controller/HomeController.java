package com.javaweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.javaweb.model.Roles;
import com.javaweb.service.RolesServiceImpl;

@RestController
public class HomeController {
	@Autowired
	RolesServiceImpl rolesServiceImpl;
	
	@RequestMapping("/home")
	List<Roles> home() {
		return (List<Roles>) rolesServiceImpl.findAll() ;
	}
	@GetMapping("/home1")
	public String home1(@RequestParam("name") String name ) {
		System.out.println("Name" + name);
		return "Name :" + name ;
	}
	
	@RequestMapping("/login")
	String login() {
		return "login";
	}

	@PostMapping("/saveroles")
	List<Roles> save(@RequestBody Roles roles) {
		System.out.println(roles.getName() + roles.getStatus()+ roles.getRoleId());
		rolesServiceImpl.saveorupdate(roles);
		return (List<Roles>) rolesServiceImpl.findAll() ;
	}
	@PutMapping("/updateroles")
	List<Roles> update(@RequestBody Roles roles) {
		System.out.println(roles.getName() + roles.getStatus()+ roles.getRoleId());
		rolesServiceImpl.saveorupdate(roles);
		return (List<Roles>) rolesServiceImpl.findAll() ;
	}
	@DeleteMapping("/delete/{roleId}")
	List<Roles> delete(@PathVariable Integer roleId) {
				rolesServiceImpl.delete(roleId);
		return (List<Roles>) rolesServiceImpl.findAll() ;
	}
	
}
