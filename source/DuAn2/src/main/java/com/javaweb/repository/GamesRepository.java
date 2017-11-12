package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.javaweb.model.Games;

import java.util.List;

@Repository
public interface GamesRepository extends JpaRepository<Games, Integer> {
	Games findByGameId(Integer gameId);
	Games findByName(String name);
	Games findBySlug(String slug);


	List<Games> findTop10ByStatusOrderByReleasesDesc(String status) ;

	List<Games> findTop10ByIsHotAndStatusOrderByReleasesDesc(Byte isHot,String status) ;
}
