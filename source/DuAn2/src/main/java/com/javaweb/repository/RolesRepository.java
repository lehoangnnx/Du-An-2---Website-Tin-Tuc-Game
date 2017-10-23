package com.javaweb.repository;
import org.springframework.stereotype.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.javaweb.model.*;


@Repository("rolesRepository")
public interface RolesRepository extends JpaRepository<Roles, Integer> {
	 Roles findByName(String name);
	 
}
