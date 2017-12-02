package com.javaweb.service;

import com.javaweb.model.ArticleCategory;

import java.util.List;

public interface ArticleCategoryService {
    List<ArticleCategory> findAll();
    ArticleCategory findByArticleCategoryId(Integer articleCategoryId);
    ArticleCategory findByName(String name);
	ArticleCategory findBySlug(String slug);
    void saveorupdate(ArticleCategory articleCategory);
    List<ArticleCategory> findAllByStatusOrderBySortOrderAsc(String status);
    ArticleCategory findTop1ByNameContainingOrSlugContainingAndStatus (String name, String slug, String status);
    List<ArticleCategory> findAllByStatusOrderByArticleCategoryIdDesc(String status);
}
