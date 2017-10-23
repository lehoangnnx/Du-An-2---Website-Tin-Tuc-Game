package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Users;

public interface UsersService {
	List<Users> findAll();
	void saveorupdate(Users user);
	void delete(Integer userId);
	Users findByUserId(Integer userId);
}
