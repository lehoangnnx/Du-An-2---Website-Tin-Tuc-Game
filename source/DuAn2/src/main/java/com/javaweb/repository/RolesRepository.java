package com.javaweb.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.javaweb.model.Roles;

import javax.management.relation.Role;


@Repository("rolesRepository")
public interface RolesRepository extends JpaRepository<Roles, Integer> {
	 Roles findByName(String name);
	Roles findByRoleId(Integer roleId);
	 
}
