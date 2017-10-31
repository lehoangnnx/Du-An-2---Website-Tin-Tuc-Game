package com.javaweb.controller.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.model.Article;
import com.javaweb.service.ArticleService;

@RestController
@RequestMapping("/admin")
public class AdminArticlesControllerAjax {
	@Autowired
	ArticleService articleService;

	@PostMapping("/validator-article")
	public String validatorArticle(@RequestBody Article article) {
		String error = "";
		Article findByTitle = null;
		Article findBySlug = null;
		try {
			System.out.println("1");
			findByTitle = articleService.findByTitle(article.getTitle());
			findBySlug = articleService.findBySlug(article.getSlug());
			System.out.println(findByTitle + "-" + findBySlug);
			
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
		} catch (Exception e) {
			System.out.println("5");
			return "msgsuccess";

		}
		// return error;
	}
}
