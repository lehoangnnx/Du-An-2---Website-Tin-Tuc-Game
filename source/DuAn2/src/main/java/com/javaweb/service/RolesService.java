/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface RolesService thưc thi xử lý
* */
package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Roles;

public interface RolesService {
	List<Roles> findAll();
	Roles findByName(String name);
	void saveorupdate(Roles roles);
	Roles findByRoleId(Integer roleId);
	List<Roles> findAllByStatusOrderByRoleIdDesc(String status);
}
