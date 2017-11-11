package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;

public interface ArticleService {
    List<Article> findAll();
    void saveorupdate(Article article);
    Article findByTitle(String title);
	Article findBySlug(String slug);
	Article findByArticleId(Integer articleId);
    List<Article> findTop5ByArticleCategoriesAndIsHotAndStatusOrderByViewsDesc(ArticleCategory articleCategory, byte isHot, String status);
    List<Article> findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(ArticleCategory articleCategory, String status);

  
}
