package com.javaweb.controller.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import com.javaweb.model.ArticleCategory;
import com.javaweb.service.ArticleCategoryService;

@RestController
@RequestMapping("/admin")
public class AdminArticlesCategoryControllerAjax {
	@Autowired
	ArticleCategoryService articleCategoryService;
	@PostMapping("/validator-categorysarticles")
	public String validatorCategorysArticles(@RequestBody ArticleCategory articleCategory) {
		ArticleCategory findByName = null;
		ArticleCategory findBySlug = null;
		
		try {
			findByName = articleCategoryService.findByName(HtmlUtils.htmlEscape(articleCategory.getName()));
			findBySlug= articleCategoryService.findBySlug(articleCategory.getSlug());
			
			if (articleCategory.getArticleCategoryId() == null) {
				if (findByName != null && findBySlug != null) {
					
					return "error";
				} else if (findByName != null) {
					
					return "errorname";
				} else if (findBySlug != null) {
					
					return "errorslug";
				} else {
					return "msgsuccess";
				}
			}else {
				if (findByName != null && findBySlug != null
						&& !findByName.getArticleCategoryId().equals(articleCategory.getArticleCategoryId())
						&& !findBySlug.getArticleCategoryId().equals(articleCategory.getArticleCategoryId())) {
					System.out.println("2");
					return "error";
				} else if (findByName != null 
						&& !findByName.getArticleCategoryId().equals(articleCategory.getArticleCategoryId())) {
					System.out.println("3");
					return "errorname";
				} else if (findBySlug != null 
						&& !findBySlug.getArticleCategoryId().equals(articleCategory.getArticleCategoryId())) {
					System.out.println("4");

					return "errorslug";
				} else {
					return "msgsuccess";
				}
			}
		} catch (Exception e) {
			return "msgsuccess";
		}
		
	}
}