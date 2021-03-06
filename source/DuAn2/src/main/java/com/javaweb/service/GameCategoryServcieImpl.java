/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp GameCategoryServcieImpl kế thừ Interface GameCategoryService thưc thi xử lý
* */
package com.javaweb.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.model.GameCategory;
import com.javaweb.repository.GameCategoryRepository;

@Service
public class GameCategoryServcieImpl implements GameCategoryService{
	@Autowired 
	GameCategoryRepository gameCategoryRepository;

	@Override
	public List<GameCategory> findAll() {
		
		return gameCategoryRepository.findAll();
	}

	@Override
	public GameCategory findByGameCategoryId(Integer gameCategoryId) {
		
		return gameCategoryRepository.findByGameCategoryId(gameCategoryId);
	}

	@Override
	public GameCategory findByName(String name) {
		
		return gameCategoryRepository.findByName(name);
	}

	@Override
	public GameCategory findBySlug(String slug) {
		
		return gameCategoryRepository.findBySlug(slug);
	}

	@Override
	public void saveorupdate(GameCategory gameCategory) {
		gameCategoryRepository.save(gameCategory);
	}

	@Override
	public List<GameCategory> findAllByStatusOrderBySortOrderDesc(String status) {
		return gameCategoryRepository.findAllByStatusOrderBySortOrderDesc(status);
	}

	@Override
	public List<GameCategory> findAllByStatus(String status) {
		return gameCategoryRepository.findAllByStatus(status);
	}
}
