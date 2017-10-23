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
}
