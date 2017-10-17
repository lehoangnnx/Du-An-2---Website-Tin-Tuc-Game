package com.javaweb.service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.javaweb.model.Roles;

public interface RolesService {
	List<Roles> findAll();
	
}
