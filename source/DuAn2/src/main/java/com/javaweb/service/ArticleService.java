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
    List<Article> findByArticleCategoriesAndIsHot(ArticleCategory articleCategory, byte isHot);
    List<Article> findByArticleCategories(ArticleCategory articleCategory);
}
