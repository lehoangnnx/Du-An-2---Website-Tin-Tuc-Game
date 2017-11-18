package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.javaweb.model.GameCategory;

import java.util.List;

@Repository
public interface GameCategoryRepository extends JpaRepository<GameCategory, Integer> {
	GameCategory findByGameCategoryId(Integer gameCategoryId);
	GameCategory findByName(String name);
	GameCategory findBySlug(String slug);


	List<GameCategory> findAllByStatusOrderBySortOrderDesc(String status);
}
