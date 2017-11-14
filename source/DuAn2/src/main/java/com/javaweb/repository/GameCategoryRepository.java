package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.javaweb.model.GameCategory;

@Repository
public interface GameCategoryRepository extends JpaRepository<GameCategory, Integer> {
	GameCategory findByGameCategoryId(Integer gameCategoryId);
	GameCategory findByName(String name);
	GameCategory findBySlug(String slug);
}
