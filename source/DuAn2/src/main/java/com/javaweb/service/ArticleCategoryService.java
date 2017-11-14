package com.javaweb.service;

import com.javaweb.model.ArticleCategory;

import java.util.List;

public interface ArticleCategoryService {
    List<ArticleCategory> findAll();
    ArticleCategory findByArticleCategoryId(Integer articleCategoryId);
    ArticleCategory findByName(String name);
	ArticleCategory findBySlug(String slug);
    void saveorupdate(ArticleCategory articleCategory);
}
