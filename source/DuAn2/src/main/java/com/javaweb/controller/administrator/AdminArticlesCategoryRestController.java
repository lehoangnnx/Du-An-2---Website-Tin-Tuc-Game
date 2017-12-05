/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp AdminArticlesCategoryRestController thực thi quản lý danh mục bài viết bằng Ajax
* */

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
public class AdminArticlesCategoryRestController {
	@Autowired
	ArticleCategoryService articleCategoryService;
	@PostMapping("/validator-categorysarticles")
	// Kiểm tra tên và đường dẫn bài viết bị trùng
	public String validatorCategorysArticles(@RequestBody ArticleCategory articleCategory) {
		ArticleCategory findByName = null;
		ArticleCategory findBySlug = null;
		
		try {
			// Lấy danh mục bài viết theo name
			findByName = articleCategoryService.findByName(HtmlUtils.htmlEscape(articleCategory.getName().trim()));
			// Lấy danh mục bài viết theo slug
			findBySlug= articleCategoryService.findBySlug(HtmlUtils.htmlEscape(articleCategory.getSlug().trim()));
			
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
					return "error";
				} else if (findByName != null 
						&& !findByName.getArticleCategoryId().equals(articleCategory.getArticleCategoryId())) {

					return "errorname";
				} else if (findBySlug != null 
						&& !findBySlug.getArticleCategoryId().equals(articleCategory.getArticleCategoryId())) {
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
