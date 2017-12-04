/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp ArticleServiceImpl kế thừ Interface ArticleService thưc thi xử lý
* */
package com.javaweb.service;

import com.javaweb.model.*;
import com.javaweb.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
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
	public List<Article> findTop5ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc(ArticleCategory articleCategory,String status, Date date) {
		return articleRepository.findTop5ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc(articleCategory,status, date);
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
	public List<Article> findTop5ByIsHotAndStatusOrderByViewsDesc(Byte isHot, String status) {
		return articleRepository.findTop5ByIsHotAndStatusOrderByViewsDesc(isHot,status);
	}

	@Override
	public List<Article> findByArticleCategoriesAndStatusAndShowDateBeforeOrderByShowDateDesc(ArticleCategory articleCategory, String status, Date date) {
		return articleRepository.findByArticleCategoriesAndStatusAndShowDateBeforeOrderByShowDateDesc(articleCategory,status,date);
	}

	@Override
	public List<Article> findAllByArticleCategoriesAndStatusAndShowDateBefore(ArticleCategory articleCategory,String status, Date date,Pageable pageable){
		return articleRepository.findAllByArticleCategoriesAndStatusAndShowDateBefore(articleCategory ,status,date,pageable);
	}

	@Override
	public List<Article> findAllByTagsesAndStatusAndShowDateBefore(Tags tags, String status, Date date, Pageable pageable) {
		return articleRepository.findAllByTagsesAndStatusAndShowDateBefore(tags,status,date,pageable);
	}

	@Override
	public List<Article> findAllByStatusAndShowDateBefore(String status, Date date, Pageable pageable) {
		return articleRepository.findAllByStatusAndShowDateBefore(status,date,pageable);
	}

	@Override
	public List<Article> findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc(ArticleCategory articleCategory, Byte isHot, String status, Date date) {
		return articleRepository.findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc(articleCategory,isHot,status,date);
	}

	@Override
	public List<Article> findTop10ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc(ArticleCategory articleCategory, String status, Date date) {
		return articleRepository.findTop10ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc( articleCategory,  status,  date);

	}

	@Override
	public List<Article> findTop5ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc(ArticleCategory articleCategory, Byte isHot, String status, Date date) {
		return articleRepository.findTop5ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc(articleCategory,isHot,status,date);
	}

	@Override
	public List<Article> findDistinctAllByTitleContainingOrSlugContainingOrSubContentContainingOrMainContentOrAuthorContainingOrArticleCategoriesOrTagsesAndStatusAndShowDateBeforeOrderByViewsDesc
			(String title, String slug, String subContent, String mainContent, String author, ArticleCategory articleCategory, Tags tags, String status, Date date,Pageable pageable) {
		return articleRepository.findDistinctAllByTitleContainingOrSlugContainingOrSubContentContainingOrMainContentOrAuthorContainingOrArticleCategoriesOrTagsesAndStatusAndShowDateBeforeOrderByViewsDesc
				(title,slug,subContent,mainContent,author,articleCategory,tags,status,date,pageable);
	}

	@Override
	public List<Article> findAllByUsersAndStatusOrderByShowDateDesc(Users users,String status) {
		return articleRepository.findAllByUsersAndStatusOrderByShowDateDesc(users,status);
	}

	@Override
	public List<Article> findAllByStatusOrderByShowDateDesc(String status) {
		return articleRepository.findAllByStatusOrderByShowDateDesc(status);
	}
}
