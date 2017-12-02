package com.javaweb.service;

import java.util.List;

import com.javaweb.model.GameCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
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

	@Override
	public List<Games> findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(GameCategory gameCategory, Byte isHot, String status) {
		return gamesRepository.findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategory,isHot,status);
	}

	@Override
	public List<Games> findTop5ByStatusAndIsHotOrderByViewsDesc(String status, Byte isHot) {
		return gamesRepository.findTop5ByStatusAndIsHotOrderByViewsDesc(status,isHot);
	}

	@Override
	public List<Games> findDistinctAllByGameCategoriesOrPublishersContainingOrNameContainingAndStatus(GameCategory gameCategory, String publishers, String name, String status, Pageable pageable) {
		return gamesRepository.findDistinctAllByGameCategoriesOrPublishersContainingOrNameContainingAndStatus(gameCategory,publishers,name,status,pageable);
	}

	@Override
	public List<Games> findDistinctByGameCategoriesAndStatus(GameCategory gameCategory, String status, Pageable pageable) {
		return gamesRepository.findDistinctByGameCategoriesAndStatus(gameCategory,status,pageable);
	}

	@Override
	public List<Games> findDistinctByGameCategoriesAndPublishersAndStatus(GameCategory gameCategory, String publishers, String status, Pageable pageable) {
		return gamesRepository.findDistinctByGameCategoriesAndPublishersAndStatus(gameCategory,publishers,status,pageable);
	}

	@Override
	public List<Games> findDistinctByGameCategoriesAndNameContainingOrSlugContainingAndStatus
	(GameCategory gameCategory, String name,String slug, String status, Pageable pageable) {
		return gamesRepository.findDistinctByGameCategoriesAndNameContainingOrSlugContainingAndStatus
		(gameCategory,name,slug,status,pageable);
	}

	@Override
	public List<Games> findDistinctByPublishersAndStatus(String publishers, String status, Pageable pageable) {
		return gamesRepository.findDistinctByPublishersAndStatus(publishers,status,pageable);
	}

	@Override
	public List<Games> findDistinctByPublishersAndNameContainingOrSlugContainingAndStatus
	(String publishers, String name,String slug, String status, Pageable pageable) {
		return gamesRepository.findDistinctByPublishersAndNameContainingOrSlugContainingAndStatus
		(publishers,name,slug,status,pageable);
	}

	@Override
	public List<Games> findDistinctByNameContainingOrSlugContainingAndStatus(String name,String slug, String status, Pageable pageable) {
		return gamesRepository.findDistinctByNameContainingOrSlugContainingAndStatus(name,slug,status,pageable);
	}

	@Override
	public List<Games> findDistinctByGameCategoriesAndPublishersAndNameContainingOrSlugContainingAndStatus
	(GameCategory gameCategory, String publishers, String name,String slug, String status, Pageable pageable) {
		return gamesRepository.findDistinctByGameCategoriesAndPublishersAndNameContainingOrSlugContainingAndStatus
		(gameCategory,publishers,name,slug,status,pageable);
	}

	@Override
	public List<Games> findAllByStatus(String status, Pageable pageable) {
		return gamesRepository.findAllByStatus(status,pageable);
	}

	@Override
	public Games findByGameIdAndStatus(Integer gameId, String status) {
		return gamesRepository.findByGameIdAndStatus(gameId,status);
	}

	@Override
	public List<String> findName(String status) {
		return gamesRepository.findName(status);
	}

	@Override
	public List<Games> findAllByStatusOrderByGameIdDesc(String status) {
		return gamesRepository.findAllByStatusOrderByGameIdDesc(status);
	}
}
