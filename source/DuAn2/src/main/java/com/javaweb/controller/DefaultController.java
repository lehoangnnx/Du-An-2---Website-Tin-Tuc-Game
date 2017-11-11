package com.javaweb.controller;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.RequestHandledEvent;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 */
@Controller
public class DefaultController {

	@Autowired
	RolesService rolesService;
	@Autowired
	PagesService pagesService;
	@Autowired
	UsersService usersService;
	@Autowired
	ArticleCategoryService articleCategoryService;
	@Autowired
	ArticleService articleService;
	@RequestMapping(value = {"/", "/home"})
	public String index(Principal p , Authentication authentication, HttpSession session,Model model) {
		
		
		if (authentication != null) {
			System.out.println("VAO DAY");
			System.out.println(authentication.getAuthorities());
			session.setAttribute("user", usersService.findByUserName(authentication.getName()));
			
		}
		
		ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
		model.addAttribute("getArticleCategoryVideo",getArticleCategoryVideo);
		List<Article> getTop5ArticleCategoryHotVideoList = articleService
				.findTop5ByArticleCategoriesAndIsHotAndStatusOrderByViewsDesc(getArticleCategoryVideo, (byte) 1,"active");
		model.addAttribute("getTop5ArticleCategoryHotVideoList",getTop5ArticleCategoryHotVideoList);

		List<Article> getTop10ArticleCategoryNewVideoList = articleService
				.findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategoryVideo,"active");
		model.addAttribute("getTop10ArticleCategoryNewVideoList",getTop10ArticleCategoryNewVideoList);

		List<Article> getTop10ArticleList = articleService
				.findTop10ByStatusOrderByShowDateDesc("active");

		model.addAttribute("getTop10ArticleList",getTop10ArticleList);




		return "home";
	}



	@ModelAttribute("articleCategoryList")
	public List<ArticleCategory> getCategory(){
		List<ArticleCategory>  articleCategoryList = articleCategoryService.findAll()
				.stream().filter(x -> x.getStatus().equals("active")).collect(Collectors.toList());

		return  articleCategoryList;

	}


	@RequestMapping("/chitiet")
	String chitiet() {
		return "chitiet";
	}
	
	@RequestMapping("/403")
	String error() {
		return "403";
	}
	
	
}
