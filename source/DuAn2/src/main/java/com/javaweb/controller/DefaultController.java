package com.javaweb.controller;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.model.Games;
import com.javaweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.RequestHandledEvent;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
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
	@Autowired
	GamesService gamesService;
	@RequestMapping(value = {"/", "/home"})
	public String index(Principal p , Authentication authentication, HttpSession session, Model model

	) {
		int pageSize = 10;

		if (authentication != null) {
			System.out.println("VAO DAY");
			System.out.println(authentication.getAuthorities());
			session.setAttribute("user", usersService.findByUserName(authentication.getName()));
			
		}


		ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
		model.addAttribute("getArticleCategoryVideo",getArticleCategoryVideo);


		List<Article> getTop10ArticleCategoryNewVideoList = articleService
				.findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategoryVideo,"active");
		model.addAttribute("getTop10ArticleCategoryNewVideoList",getTop10ArticleCategoryNewVideoList);



		List<Article> getTop10ArticleList = articleService
				.findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc("active", new Date());

		model.addAttribute("getTop10ArticleList",getTop10ArticleList);






		return "home";
	}

	@ModelAttribute("getTop5ArticleCategoryHotVideoList")
	public List<Article> getTop5ArticleCategoryHotVideoList(){
		ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
		List<Article> getTop5ArticleCategoryHotVideoList = articleService
				.findTop5ByArticleCategoriesAndIsHotAndStatusOrderByViewsDesc(getArticleCategoryVideo, (byte) 1,"active");
		getTop5ArticleCategoryHotVideoList.forEach(x -> System.out.println(x.getSlug()));
		return getTop5ArticleCategoryHotVideoList;
	}
	@ModelAttribute("getTop10HotArticle")
	public List<Article> getTop10HotArticle(){
		ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
		List<Article> getTop10HotArticle = articleService.findTop10ByIsHotAndStatusOrderByViewsDesc((byte) 1, "active")
				.stream().filter(x -> x.getArticleCategories() != getArticleCategoryVideo).collect(Collectors.toList());
		getTop10HotArticle.forEach(x -> System.out.println(x.getTitle()));
		return getTop10HotArticle;
	}
	@ModelAttribute("getTop10NewGame")
	public List<Games> getTop10NewGame(){
		List<Games>  getTop10NewGame= gamesService.findTop10ByStatusOrderByReleasesDesc("active");
		return getTop10NewGame;
	}

	@ModelAttribute("getTop10HotGame")
	public List<Games> getTop10HotGame(){
		List<Games>  getTop10HotGame= gamesService.findTop10ByIsHotAndStatusOrderByReleasesDesc((byte) 1,"active");
		return getTop10HotGame;
	}

	@ModelAttribute("articleCategoryList")
	public List<ArticleCategory> getCategory(){
		List<ArticleCategory>  articleCategoryList = articleCategoryService.findAll()
				.stream().filter(x -> x.getStatus().equals("active")).collect(Collectors.toList());

		return  articleCategoryList;

	}


	@RequestMapping("/{slug}")
	String chitiet(@PathVariable("slug") String slug, Model model) {
		Article article = null;
		try {
			article = articleService.findBySlug(slug);
			if (article != null){

				article.setMainContent(HtmlUtils.htmlUnescape(article.getMainContent()));
				model.addAttribute("article",article);
				return "chitiet";
			}
		}catch (Exception e){

		}

		return "chitiet";
	}
	
	@RequestMapping("/403")
	String error() {
		return "403";
	}
	
	
}
