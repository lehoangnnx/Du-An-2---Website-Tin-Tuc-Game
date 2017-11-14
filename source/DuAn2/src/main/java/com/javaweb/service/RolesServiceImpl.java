package com.javaweb.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.model.Roles;
import com.javaweb.repository.RolesRepository;


@Service("rolesService")
public class RolesServiceImpl implements RolesService {
	
	@Autowired
	RolesRepository rolesRepository;
	
	@PersistenceContext
    private EntityManager entityManger;


    
	@Override
	public List<Roles> findAll() {
		return rolesRepository.findAll();
	}



	@Override
	public Roles findByName(String name) {
		
		return rolesRepository.findByName(name);
	}
	 
	
	
	
}
