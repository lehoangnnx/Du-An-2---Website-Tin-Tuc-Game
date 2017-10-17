package com.javaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.model.Roles;

import com.javaweb.repository.RolesRepository;


@Service("rolesService")
public class RolesServiceImpl implements RolesService {
	@Autowired
	RolesRepository rolesRepository;
	
	@Override
	public List<Roles> findAll() {
		return rolesRepository.findAll();
		
	}
	 
	
	
	
}
