package com.javaweb.service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.javaweb.model.Roles;

public interface RolesService {
	List<Roles> findAll();
	Roles findByName(String name);
}
