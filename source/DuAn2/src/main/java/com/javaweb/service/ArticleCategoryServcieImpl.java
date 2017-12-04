/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp ArticleCategoryServiceImpl kế thừ Interface ArticleCategoryService thưc thi xử lý
* */

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

	@Override
	public List<ArticleCategory> findAllByStatusOrderBySortOrderAsc(String status) {
		return articleCategoryRepository.findAllByStatusOrderBySortOrderAsc(status);
	}

	@Override
	public ArticleCategory findTop1ByNameContainingOrSlugContainingAndStatus(String name, String slug, String status) {
		return articleCategoryRepository.findTop1ByNameContainingOrSlugContainingAndStatus(name,slug,status);
	}

	@Override
	public List<ArticleCategory> findAllByStatusOrderByArticleCategoryIdDesc(String status) {
		return articleCategoryRepository.findAllByStatusOrderByArticleCategoryIdDesc(status);
	}
}
