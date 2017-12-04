/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* InterfaceGamesServiceService thưc thi xử lý
* */
package com.javaweb.service;

import java.util.List;

import com.javaweb.model.GameCategory;
import com.javaweb.model.Games;
import org.springframework.data.domain.Pageable;

public interface GamesService {
	List<Games> findAll();
	Games findByGameId(Integer gameId);
	Games findByName(String name);
	Games findBySlug(String slug);
	void saveorupdate(Games games);
	List<Games> findTop10ByStatusOrderByReleasesDesc(String status) ;
	List<Games> findTop10ByIsHotAndStatusOrderByReleasesDesc(Byte isHot,String status) ;
	List<Games> findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(GameCategory gameCategory, Byte isHot, String status) ;
	List<Games> findTop5ByStatusAndIsHotOrderByViewsDesc(String status,Byte isHot);
	List<Games> findDistinctAllByGameCategoriesOrPublishersContainingOrNameContainingAndStatus(GameCategory gameCategory, String publishers, String name, String status, Pageable pageable);


	List<Games> findDistinctByGameCategoriesAndStatus(GameCategory gameCategory,String status,Pageable pageable);
	List<Games> findDistinctByGameCategoriesAndPublishersAndStatus
			(GameCategory gameCategory,String publishers,String status,Pageable pageable);

	List<Games> findDistinctByGameCategoriesAndNameContainingOrSlugContainingAndStatus
	(GameCategory gameCategory,String name,String slug,String status,Pageable pageable);

	List<Games> findDistinctByPublishersAndStatus(String publishers,String status,Pageable pageable);
	List<Games> findDistinctByPublishersAndNameContainingOrSlugContainingAndStatus
		(String publishers,String name,String slug,String status,Pageable pageable);

	List<Games> findDistinctByNameContainingOrSlugContainingAndStatus
	(String name,String slug,String status,Pageable pageable);

	List<Games> findDistinctByGameCategoriesAndPublishersAndNameContainingOrSlugContainingAndStatus
	(GameCategory gameCategory, String publishers, String name,String slug, String status, Pageable pageable);
	List<Games> findAllByStatus(String status, Pageable pageable);
	Games findByGameIdAndStatus(Integer gameId,String status);
	List<String> findName(String status);
	List<Games> findAllByStatusOrderByGameIdDesc(String status);
}
