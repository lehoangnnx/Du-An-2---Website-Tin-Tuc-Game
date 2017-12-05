/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp AdminArticlesRestController thực thi quản lý bài viết bằng Ajax
* */

package com.javaweb.controller.administrator;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletContext;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.HtmlUtils;

import com.javaweb.model.Article;
import com.javaweb.service.ArticleService;
import com.javaweb.service.UsersService;

@RestController
@RequestMapping("/admin")
public class AdminArticlesRestController {
	@Autowired
	ArticleService articleService;
	@Autowired
	UsersService usersService;

	@Autowired
	ServletContext context;

	@PostMapping("/validator-article")
	// Kiểm tra tiêu đề và đường dẫn bài viết bị trùng
	public String validatorArticle(@RequestBody Article article) {

		Article findByTitle = null;
		Article findBySlug = null;
		
		try {
			findByTitle = articleService.findByTitle(HtmlUtils.htmlEscape(article.getTitle().trim()));
			findBySlug = articleService.findBySlug(HtmlUtils.htmlEscape(article.getSlug().trim()));

			if (article.getArticleId() == null) {
				if (findByTitle != null && findBySlug != null) {
					return "error";
				} else if (findByTitle != null) {
					return "errortitle";
				} else if (findBySlug != null) {

					return "errorslug";
				} else {
					return "msgsuccess";
				}
			} else {
				if (findByTitle != null && findBySlug != null
						&& !findByTitle.getArticleId().equals(article.getArticleId())
						&& !findBySlug.getArticleId().equals(article.getArticleId())) {

					return "error";
				} else if (findByTitle != null && !findByTitle.getArticleId().equals(article.getArticleId())) {

					return "errortitle";
				} else if (findBySlug != null && !findBySlug.getArticleId().equals(article.getArticleId())) {

					return "errorslug";
				} else {
					return "msgsuccess";
				}
			}

		} catch (Exception e) {
			System.out.println("5");
			return "msgsuccess";

		}
		// return error;
	}

	@PostMapping("/updateStatusArticles")
	// Update trạng thái của bài viết
	public String updateStatusArticles(@RequestBody Article article, Principal principal) {

		try {
			Article getArticleById = articleService.findByArticleId(article.getArticleId());
			getArticleById.setStatus(article.getStatus());
			getArticleById.setActivateDate(new Date());
			getArticleById.setActivateUserId(usersService.findByUserName(principal.getName().trim()).getUserId());
			articleService.saveorupdate(getArticleById);
			return "success";
		} catch (Exception e) {
			return "error";
		}

	}


}
