package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Games;

public interface GamesService {
	List<Games> findAll();
	Games findByGameId(Integer gameId);
	Games findByName(String name);
	Games findBySlug(String slug);
	void saveorupdate(Games games);
	List<Games> findTop10ByStatusOrderByReleasesDesc(String status) ;
	List<Games> findTop10ByIsHotAndStatusOrderByReleasesDesc(Byte isHot,String status) ;
}
