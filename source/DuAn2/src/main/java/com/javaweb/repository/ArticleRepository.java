package com.javaweb.repository;

import com.javaweb.model.ArticleCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.model.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Integer> {
	Article findByTitle(String title);
	Article findBySlug(String slug);
	Article findByArticleId(Integer articleId);
	List<Article> findByArticleCategoriesAndIsHot(ArticleCategory articleCategory, byte isHot);
	List<Article> findByArticleCategories(ArticleCategory articleCategory);

}
