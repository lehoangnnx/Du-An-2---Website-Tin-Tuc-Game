package com.javaweb.controller.administrator;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
	@PersistenceContext
    EntityManager entityManager;
	@PostMapping("/validator-article")
	public String validatorArticle(@RequestBody Article article) {
		System.out.println("IIIII :" + article.getArticleId());
		Article findByTitle = null;
		Article findBySlug = null;
		
		try {
			System.out.println("1");
			findByTitle = articleService.findByTitle(HtmlUtils.htmlEscape(article.getTitle()));
			findBySlug = articleService.findBySlug(HtmlUtils.htmlEscape(article.getSlug()));

			if (article.getArticleId() == null) {
				if (findByTitle != null && findBySlug != null) {
					System.out.println("2");
					return "error";
				} else if (findByTitle != null) {
					System.out.println("3");
					return "errortitle";
				} else if (findBySlug != null) {
					System.out.println("4");

					return "errorslug";
				} else {
					return "msgsuccess";
				}
			} else {
				if (findByTitle != null && findBySlug != null
						&& !findByTitle.getArticleId().equals(article.getArticleId())
						&& !findBySlug.getArticleId().equals(article.getArticleId())) {
					System.out.println("2");
					return "error";
				} else if (findByTitle != null && !findByTitle.getArticleId().equals(article.getArticleId())) {
					System.out.println("3");
					return "errortitle";
				} else if (findBySlug != null && !findBySlug.getArticleId().equals(article.getArticleId())) {
					System.out.println("4");

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
	public String updateStatusArticles(@RequestBody Article article, Principal principal) {
		System.out.println(article.getStatus() + article.getArticleId());
		try {
			Article getArticleById = articleService.findByArticleId(article.getArticleId());
			getArticleById.setStatus(article.getStatus());
			getArticleById.setActivateDate(new Date());
			getArticleById.setActivateUserId(usersService.findByUserName(principal.getName()).getUserId());
			articleService.saveorupdate(getArticleById);
			return "success";
		} catch (Exception e) {
			return "error";
		}

	}

	@GetMapping("/getarticlesactive")
	public List<Article> showactive() {
		

		return null;
	}
}
