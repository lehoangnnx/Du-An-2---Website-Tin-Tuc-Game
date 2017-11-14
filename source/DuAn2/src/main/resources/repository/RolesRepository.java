package com.javaweb.repository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.model.*;


@Repository("rolesRepository")
public interface RolesRepository extends JpaRepository<Roles, Integer> {

}
