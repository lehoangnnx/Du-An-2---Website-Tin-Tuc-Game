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
		List<Article> getArticleCategoryTopVideoList = articleService.findByArticleCategoriesAndIsHot(getArticleCategoryVideo, (byte) 1)
				.stream().sorted(Comparator.comparing(Article::getViews).reversed()).limit(5)
				.collect(Collectors.toList());
		List<Article> getArticleCategoryNewVideoList = articleService.findByArticleCategories(getArticleCategoryVideo)
				.stream().sorted(Comparator.comparing(Article::getCreatedDate).reversed()).limit(10)
				.collect(Collectors.toList());
		model.addAttribute("getArticleCategoryVideo",getArticleCategoryVideo);
		model.addAttribute("getArticleCategoryTopVideoList",getArticleCategoryTopVideoList);
		model.addAttribute("getArticleCategoryNewVideoList",getArticleCategoryNewVideoList);





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
