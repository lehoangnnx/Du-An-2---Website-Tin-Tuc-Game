/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface UsersService thưc thi xử lý
* */
package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Users;

public interface UsersService {
	List<Users> findAll();
	void saveorupdate(Users user);
	void delete(Integer userId);
	Users findByUserId(Integer userId);
	Users findByUserName(String userName);
	Users findByEmail(String email);
	Users findByForgotpassword(String forgotpassword);
	Users findByUserNameAndStatus(String userName,String status);
	List<Users> findAllByStatusOrderByCreatedDateDesc(String status);
}
