package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.model.Users;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersRepository extends JpaRepository<Users, Integer> {
	 Users findByUserName(String userName);
	 Users findByEmail(String email);
	 Users findByUserId(Integer userId);
}
