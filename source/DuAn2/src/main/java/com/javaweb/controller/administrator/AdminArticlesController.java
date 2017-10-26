package com.javaweb.controller.administrator;

import com.javaweb.model.Article;
import com.javaweb.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminArticlesController {
	@Autowired
	ArticleService articleService;


	@GetMapping("/articles")
	public String getAllArticles(Model model) {

		List<Article> articleList = articleService.findAll();
		model.addAttribute("articleList", articleList);
		return "articles";
	}

	@GetMapping("/addarticles")
	public String addarticles(){
		return "addarticles";
	}
}
