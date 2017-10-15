package com.javaweb.service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.javaweb.model.Roles;

public interface RolesService {
	@Query("SELECT r FROM Roles r WHERE r.name = 'Admin'")
	public List<Roles> findAllBy();	
		
	
}
