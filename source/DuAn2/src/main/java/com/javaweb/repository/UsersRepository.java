package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.model.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersRepository extends JpaRepository<Users, Integer> {
	 Users findByUserName(String userName);
	 Users findByEmail(String email);
	 Users findByUserId(Integer userId);
	Users findByForgotpassword(String forgotpassword);
	Users findByUserNameAndStatus(String userName,String status);
	List<Users> findAllByStatusOrderByCreatedDateDesc(String status);
}
