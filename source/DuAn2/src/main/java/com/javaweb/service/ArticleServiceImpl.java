package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleRepository articleRepository;

    @Override
    public List<Article> findAll() {
        return articleRepository.findAll();
    }

	
	@Override
	public void saveorupdate(Article article) {
		articleRepository.save(article);
	}


	@Override
	public Article findByTitle(String title) {
		
		return articleRepository.findByTitle(title);
	}


	@Override
	public Article findBySlug(String slug) {
		
		return articleRepository.findBySlug(slug);
	}


	@Override
	public Article findByArticleId(Integer articleId) {
		
		return articleRepository.findByArticleId( articleId);
	}

	@Override
	public List<Article> findByArticleCategoriesAndIsHot(ArticleCategory articleCategory, byte isHot) {
		return articleRepository.findByArticleCategoriesAndIsHot(articleCategory,isHot);
	}

	@Override
	public List<Article> findByArticleCategories(ArticleCategory articleCategory) {
		return articleRepository.findByArticleCategories(articleCategory);
	}
}
