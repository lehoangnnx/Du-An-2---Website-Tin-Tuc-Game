package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Roles;

public interface RolesService {
	List<Roles> findAll();
	Roles findByName(String name);
	void saveorupdate(Roles roles);
	Roles findByRoleId(Integer roleId);
}
