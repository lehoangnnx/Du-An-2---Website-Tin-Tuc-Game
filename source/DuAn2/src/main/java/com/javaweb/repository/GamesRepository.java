
/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface GamesRepository thưc thi truy vấn trưc tiếp với cơ sỡ dư liệu
* */
package com.javaweb.repository;

import com.javaweb.model.GameCategory;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


import com.javaweb.model.Games;

import java.util.List;

@Repository
public interface GamesRepository extends JpaRepository<Games, Integer> {
	Games findByGameId(Integer gameId);
	Games findByGameIdAndStatus(Integer gameId,String status);
	Games findByName(String name);
	Games findBySlug(String slug);


	List<Games> findTop10ByStatusOrderByReleasesDesc(String status) ;

	List<Games> findTop10ByIsHotAndStatusOrderByReleasesDesc(Byte isHot,String status) ;

	List<Games> findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(GameCategory gameCategory, Byte isHot, String status) ;

	List<Games> findTop5ByStatusAndIsHotOrderByViewsDesc(String status,Byte isHot);

	List<Games> findDistinctAllByGameCategoriesOrPublishersContainingOrNameContainingAndStatus
			(GameCategory gameCategory, String publishers, String name, String status, Pageable pageable);

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
	@Query("select g.name from Games g where g.status = ?1")
	List<String> findName(String status);

	List<Games> findAllByStatusOrderByGameIdDesc(String status);

}
