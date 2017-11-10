package com.javaweb.service;

import com.javaweb.model.Users;
import com.javaweb.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    @Autowired
    UsersRepository usersRepository;
    @Override
    public List<Users> findAll() {
        return usersRepository.findAll();
    }
	@Override
	public void delete(Integer userId) {
		usersRepository.delete(userId);
		
	}
	@Override
	public Users findByUserId(Integer userId) {
		
		return usersRepository.findByUserId(userId);
	}
	@Override
	public void saveorupdate(Users user) {
		usersRepository.save(user);
		
	}
	@Override
	public Users findByEmail(String email) {
		
		return usersRepository.findByEmail(email);
	}

	@Override
	public Users findByForgotPassword(String forgotpassword) {
		return usersRepository.findByForgotPassword(forgotpassword);
	}

	@Override
	public Users findByUserName(String userName) {
		
		return usersRepository.findByUserName(userName);
	}
}
