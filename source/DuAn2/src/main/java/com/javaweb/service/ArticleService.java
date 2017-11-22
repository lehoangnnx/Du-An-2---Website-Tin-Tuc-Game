package com.javaweb.service;

import java.util.Date;
import java.util.List;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.model.Comment;
import com.javaweb.model.Tags;
import org.springframework.data.domain.Pageable;

public interface ArticleService {
    List<Article> findAll();
    void saveorupdate(Article article);
    Article findByTitle(String title);
	Article findBySlug(String slug);
	Article findByArticleId(Integer articleId);
    List<Article> findTop5ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc(ArticleCategory articleCategory,  String status , Date date);
    List<Article> findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(ArticleCategory articleCategory, String status);

    List<Article> findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc(String status, Date date);

    List<Article> findTop10ByIsHotAndStatusOrderByViewsDesc( Byte isHot, String status);

    List<Article> findByStatusAndShowDateBeforeOrderByShowDateDesc(String status, Date date);

    List<Article> findTop5ByIsHotAndStatusOrderByViewsDesc(Byte isHot, String status);
    List<Article> findByArticleCategoriesAndStatusAndShowDateBeforeOrderByShowDateDesc(ArticleCategory articleCategory, String status, Date date);
    List<Article> findAllByArticleCategoriesAndStatusAndShowDateBefore(ArticleCategory articleCategory,String status, Date date,Pageable pageable);


    List<Article> findAllByTagsesAndStatusAndShowDateBefore(Tags tags, String status, Date date, Pageable pageable);

    List<Article> findAllByStatusAndShowDateBefore( String status, Date date, Pageable pageable);
    List<Article> findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc(ArticleCategory articleCategory,Byte isHot, String status, Date date);
    List<Article> findTop10ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc(ArticleCategory articleCategory, String status, Date date);
    List<Article> findTop5ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc(ArticleCategory articleCategory,Byte isHot, String status, Date date);
    List<Article> findDistinctAllByTitleContainingOrSlugContainingOrSubContentContainingOrMainContentOrAuthorContainingOrArticleCategoriesOrTagsesAndStatusAndShowDateBeforeOrderByViewsDesc
            (String title,String slug,String subContent,String mainContent,String author, ArticleCategory articleCategory, Tags tags, String status, Date date, Pageable pageable);


}
