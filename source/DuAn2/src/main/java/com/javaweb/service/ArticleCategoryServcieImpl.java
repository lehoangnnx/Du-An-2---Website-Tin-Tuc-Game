package com.javaweb.service;


import com.javaweb.model.ArticleCategory;
import com.javaweb.repository.ArticleCategoryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleCategoryServcieImpl implements ArticleCategoryService {
    @Autowired
    ArticleCategoryRepository articleCategoryRepository;

    @Override
    public List<ArticleCategory> findAll() {
        return articleCategoryRepository.findAll();
    }

	@Override
	public ArticleCategory findByArticleCategoryId(Integer articleCategoryId) {
		
		return articleCategoryRepository.findByArticleCategoryId(articleCategoryId);
	}

	@Override
	public void saveorupdate(ArticleCategory articleCategory) {
		articleCategoryRepository.save(articleCategory);
		
	}

	@Override
	public ArticleCategory findByName(String name) {
		
		return articleCategoryRepository.findByName(name);
	}

	@Override
	public ArticleCategory findBySlug(String slug) {
	
		return articleCategoryRepository.findBySlug(slug);
	}
}
