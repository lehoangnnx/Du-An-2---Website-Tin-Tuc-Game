/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface GameCategoryRepository thưc thi truy vấn trưc tiếp với cơ sỡ dư liệu
* */
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
	List<GameCategory> findAllByStatus(String status);
}
