/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface ArticleCategoryRepository thưc thi truy vấn trưc tiếp với cơ sỡ dư liệu
* */
package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.javaweb.model.ArticleCategory;

import java.util.List;

@Repository
public interface ArticleCategoryRepository extends JpaRepository<ArticleCategory, Integer> {
	ArticleCategory findByArticleCategoryId(Integer articleCategoryId);
	ArticleCategory findByName(String name);
	ArticleCategory findBySlug(String slug);
	List<ArticleCategory> findAllByStatusOrderBySortOrderAsc(String status);

	ArticleCategory findTop1ByNameContainingOrSlugContainingAndStatus (String name, String slug, String status);
	List<ArticleCategory> findAllByStatusOrderByArticleCategoryIdDesc(String status);

}
