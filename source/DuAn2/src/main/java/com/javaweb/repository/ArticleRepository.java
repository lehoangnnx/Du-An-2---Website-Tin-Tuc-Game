/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface ArticleRepository thưc thi truy vấn trưc tiếp với cơ sỡ dư liệu
* */
package com.javaweb.repository;

import com.javaweb.model.*;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Integer>,JpaSpecificationExecutor<Article> {
	Article findByTitle(String title);
	Article findBySlug(String slug);
	Article findByArticleId(Integer articleId);
	List<Article> findTop5ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc
			(ArticleCategory articleCategory,  String status, Date date);

	List<Article> findTop5ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
			(ArticleCategory articleCategory,Byte isHot, String status, Date date);

	List<Article> findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc
			(ArticleCategory articleCategory, String status);
	List<Article> findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc(String status, Date date);

	List<Article> findTop10ByIsHotAndStatusOrderByViewsDesc( Byte isHot, String status);

	List<Article> findByStatusAndShowDateBeforeOrderByShowDateDesc(String status, Date date);

	List<Article> findTop5ByIsHotAndStatusOrderByViewsDesc(Byte isHot, String status);
	List<Article> findByArticleCategoriesAndStatusAndShowDateBeforeOrderByShowDateDesc
			(ArticleCategory articleCategory, String status, Date date);

	List<Article> findAllByArticleCategoriesAndStatusAndShowDateBefore
			(ArticleCategory articleCategory,String status, Date date,Pageable pageable);
	List<Article> findAllByTagsesAndStatusAndShowDateBefore(Tags tags, String status, Date date, Pageable pageable);

	List<Article> findAllByStatusAndShowDateBefore( String status, Date date, Pageable pageable);
	List<Article> findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
			(ArticleCategory articleCategory,Byte isHot, String status, Date date);

	List<Article> findTop10ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc
			(ArticleCategory articleCategory, String status, Date date);


	List<Article> findDistinctAllByTitleContainingOrSlugContainingOrSubContentContainingOrMainContentOrAuthorContainingOrArticleCategoriesOrTagsesAndStatusAndShowDateBeforeOrderByViewsDesc
			(String title,String slug,String subContent,String mainContent,String author, ArticleCategory articleCategory, Tags tags,  String status, Date date, Pageable pageable);


	List<Article> findAllByUsersAndStatusOrderByShowDateDesc(Users users,String status);
	List<Article> findAllByStatusOrderByShowDateDesc(String status);
}
