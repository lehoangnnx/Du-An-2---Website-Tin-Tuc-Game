package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.model.Users;



public interface UsersRepository extends JpaRepository<Users, Integer> {
	public Users findByUserName(String userName);
}
