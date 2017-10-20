package com.javaweb.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletContext;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
		return rolesRepository.findAllBy();
	}
	 
	
	
	
}
