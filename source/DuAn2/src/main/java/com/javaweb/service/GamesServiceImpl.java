package com.javaweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.model.Games;
import com.javaweb.repository.GamesRepository;

@Service
public class GamesServiceImpl implements GamesService {
	@Autowired
	GamesRepository gamesRepository; 
	@Override
	public List<Games> findAll() {
		
		return gamesRepository.findAll();
	}

	@Override
	public Games getOne(Integer id) {
		return gamesRepository.getOne(id);
	}

}
