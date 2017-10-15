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
	RolesService rolesService;
	
	public List<Roles> findAll() {
		return rolesRepository.findAll();
		
	}
	
	public void saveorupdate(Roles roles) {
		rolesRepository.save(roles);
	}
	
	public void delete(Integer roleId) {
		rolesRepository.delete(roleId);
	}
	@Override
	public List<Roles> findAllBy() {
		
		return rolesService.findAllBy();
	}
	
}
