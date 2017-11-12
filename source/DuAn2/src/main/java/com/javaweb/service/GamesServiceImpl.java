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
	public Games findByGameId(Integer gameId) {
		return gamesRepository.findByGameId(gameId);
	}

	@Override
	public Games findByName(String name) {
		
		return gamesRepository.findByName(name);
	}

	@Override
	public Games findBySlug(String slug) {
		
		return gamesRepository.findBySlug(slug);
	}

	@Override
	public void saveorupdate(Games games) {
		gamesRepository.save(games);
	}

	@Override
	public List<Games> findTop10ByStatusOrderByReleasesDesc(String status) {
		return gamesRepository.findTop10ByStatusOrderByReleasesDesc(status);
	}

	@Override
	public List<Games> findTop10ByIsHotAndStatusOrderByReleasesDesc(Byte isHot, String status) {
		return gamesRepository.findTop10ByIsHotAndStatusOrderByReleasesDesc(isHot,status);
	}

}
