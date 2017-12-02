package com.javaweb.service;

import java.util.List;

import com.javaweb.model.GameCategory;


public interface GameCategoryService {
	List<GameCategory> findAll();
	GameCategory findByGameCategoryId(Integer gameCategoryId);
	GameCategory findByName(String name);
	GameCategory findBySlug(String slug);
	void saveorupdate(GameCategory gameCategory);
	List<GameCategory> findAllByStatusOrderBySortOrderDesc(String status);
	List<GameCategory> findAllByStatus(String status);
}
