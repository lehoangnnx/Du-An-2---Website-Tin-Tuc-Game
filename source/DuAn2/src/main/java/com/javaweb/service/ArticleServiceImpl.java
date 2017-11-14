package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
	public List<Article> findTop5ByArticleCategoriesAndIsHotAndStatusOrderByViewsDesc(ArticleCategory articleCategory, Byte isHot,String status) {
		return articleRepository.findTop5ByArticleCategoriesAndIsHotAndStatusOrderByViewsDesc(articleCategory,isHot,status);
	}

	@Override
	public List<Article> findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(ArticleCategory articleCategory,String status) {
		return articleRepository.findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(articleCategory,status);
	}

	@Override
	public List<Article> findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc(String status, Date date){
		return articleRepository.findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc( status,  date);
	}

	@Override
	public List<Article> findTop10ByIsHotAndStatusOrderByViewsDesc(Byte isHot, String status) {
		return articleRepository.findTop10ByIsHotAndStatusOrderByViewsDesc(isHot,status);
	}

	@Override
	public List<Article> findByStatusAndShowDateBeforeOrderByShowDateDesc(String status, Date date) {
		return articleRepository.findByStatusAndShowDateBeforeOrderByShowDateDesc( status,  date);
	}

	@Override
	public Article findTop1ByIsHotAndStatusOrderByViewsDesc(Byte isHot, String status) {
		return articleRepository.findTop1ByIsHotAndStatusOrderByViewsDesc(isHot,status);
	}
}
