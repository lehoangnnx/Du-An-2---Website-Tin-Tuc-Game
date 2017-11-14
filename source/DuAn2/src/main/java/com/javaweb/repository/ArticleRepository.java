package com.javaweb.repository;

import com.javaweb.model.ArticleCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.model.Article;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Integer> {
	Article findByTitle(String title);
	Article findBySlug(String slug);
	Article findByArticleId(Integer articleId);
	List<Article> findTop5ByArticleCategoriesAndIsHotAndStatusOrderByViewsDesc(ArticleCategory articleCategory, Byte isHot, String status);
	List<Article> findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(ArticleCategory articleCategory, String status);
	List<Article> findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc(String status, Date date);

	List<Article> findTop10ByIsHotAndStatusOrderByViewsDesc( Byte isHot, String status);

	List<Article> findByStatusAndShowDateBeforeOrderByShowDateDesc(String status, Date date);

	Article findTop1ByIsHotAndStatusOrderByViewsDesc(Byte isHot, String status);
	List<Article> findByArticleCategoriesAndStatusAndShowDateBeforeOrderByShowDateDesc(ArticleCategory articleCategory, String status, Date date);



}
