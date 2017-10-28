package com.javaweb.controller.administrator;

import com.javaweb.controller.ImagesManager;
import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.model.Games;
import com.javaweb.model.Tags;
import com.javaweb.service.ArticleCategoryService;
import com.javaweb.service.ArticleService;
import com.javaweb.service.GamesService;
import com.javaweb.service.TagsService;
import com.javaweb.service.UsersService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.httpBasic;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;

@Controller
@RequestMapping("/admin")
public class AdminArticlesController {
	@Autowired
	ArticleService articleService;
	@Autowired
	ArticleCategoryService articleCategoryService;
	@Autowired
	GamesService gamesService;
	@Autowired
	TagsService tagsService;
	@Autowired
	ImagesManager imagesManager;
	@Autowired
	ServletContext context;
	@Autowired
	UsersService usersService; 
	@GetMapping("/articles")
	public String getAllArticles(Model model) {

		List<Article> articleList = articleService.findAll();
		model.addAttribute("articleList", articleList);
		return "articles";
	}

	@GetMapping("/addarticles")
	public String addarticles(Model model) {
		List<ArticleCategory> articleCategoryList = articleCategoryService.findAll();
		List<Games> gameList = gamesService.findAll();
		List<Tags> tagsList = tagsService.findAll();
		model.addAttribute("articleCategoryList", articleCategoryList);
		model.addAttribute("gameList", gameList);
		model.addAttribute("tagsList", tagsList);
		return "addarticles";
	}

	@PostMapping("/articles")
	public String addarticles(@RequestParam("title") String title, @RequestParam("slug") String slug,
			@RequestParam("articleCategories") List<Integer> articleCategoriesList,
			@RequestParam("status") String status, @RequestParam("isHot") int isHot,
			@RequestParam("subContent") String subContent, @RequestParam("mainContent") String mainContent,
			@RequestParam("author") String author, @RequestParam("gameId") Integer gameId,
			@RequestParam("tags") List<Integer> tagsList, @RequestParam("showDate") String showDate,

			@RequestParam("video") String video, @RequestParam("imagesThumbnail") MultipartFile imagesThumbnail

	) {
		String monthAndYear = imagesManager.getMonthAndYearNow();
		String photoPath = context.getRealPath("/WEB-INF/files/images/articles/" + monthAndYear);
		Article article = new Article();
		HashSet<ArticleCategory> articleCategories = new HashSet<>();
		HashSet<Tags> tagses = new HashSet<>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

		try {
			article.setTitle(HtmlUtils.htmlEscape(title));
			article.setSlug(HtmlUtils.htmlEscape(slug));
			article.setSubContent(HtmlUtils.htmlEscape(subContent));
			article.setMainContent(HtmlUtils.htmlEscape(mainContent));
			article.setAuthor(HtmlUtils.htmlEscape(author));
			article.setStatus(status);
			article.setViews(0);
			article.setCreatedDate(new Date());
			article.setIsHot((byte) isHot);
			Date date = df.parse(showDate);
			article.setShowDate(date);
			article.setVideo(video);

			article.setGameId(gameId);

			articleCategoriesList
					.forEach(x -> articleCategories.add(articleCategoryService.findByArticleCategoryId(x)));
			tagsList.forEach(x -> tagses.add(tagsService.findTagsId(x)));
			
			article.setArticleCategories(articleCategories);
			article.setTagses(tagses);
			article.setUsers(usersService.findByUserId(3));
			if (!imagesThumbnail.isEmpty()) {
				boolean checkFolderExists = imagesManager.checkFolderExists(photoPath);
				if (checkFolderExists) {
					String newNameFile = imagesManager.renameFile(imagesThumbnail.getOriginalFilename());
					byte[] bytes = imagesThumbnail.getBytes();
					Path path = Paths.get(photoPath + newNameFile);
					Files.write(path, bytes);

					article.setImagesThumbnail(monthAndYear + newNameFile);

				}

			}
			articleService.saveorupdate(article);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e.getStackTrace());
		}

		return "redirect:/admin/addarticles";
	}
}
