package com.javaweb.controller.administrator;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.javaweb.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;
/*
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.httpBasic;*/

import com.javaweb.controller.ImagesManager;
import com.javaweb.controller.Slugify;
import com.javaweb.service.ArticleCategoryService;
import com.javaweb.service.ArticleService;
import com.javaweb.service.GamesService;
import com.javaweb.service.TagsService;
import com.javaweb.service.UsersService;

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
	@Autowired
	Slugify slugify;

	/*
	 * Phương thức Get hiển thi trang articles Đường đẫn : /admin/article Trả Về :
	 * Tên articles trong file layout-administrator-tiles.xml cấu hình Apache Tiles
	 */
	@GetMapping("/articles")
	public String getAllArticles(Model model, Authentication authentication, @RequestParam(name = "status", defaultValue = "active") String status,
								 HttpServletRequest request) {

		// Lấy danh sách Article
		List<Article> articleList = null;
		if(request.isUserInRole("ROLE_ADMIN")){
			articleList = articleService.findAllByStatusOrderByShowDateDesc(status);

		}else {
			Users users = usersService.findByUserName(authentication.getName());
			articleList = articleService.findAllByUsersAndStatusOrderByShowDateDesc(users,status);
		}



		// articleList.sort(( a1, a2) ->
		// a1.getCreatedDate().compareTo(a2.getCreatedDate()));

		// Lưu danh sách articleList vào Model
		model.addAttribute("articleList", articleList);
		return "articles";
	}

	/*
	 * Phương thức Get hiển thi trang thêm articles Đường đẫn : /admin/addarticle
	 * Trả Về : Tên addarticles trong file layout-administrator-tiles.xml cấu hình
	 * Apache Tiles
	 */
	@GetMapping("/addarticles")
	public String addarticles(Model model) {
		// Lấy danh sách ArticleCategory
		List<ArticleCategory> articleCategoryList = articleCategoryService.findAllByStatusOrderByArticleCategoryIdDesc("active");
		// Lấy danh sách Games
		List<Games> gameList = gamesService.findAllByStatusOrderByGameIdDesc("active");
		// Lấy danh sách Tags
		List<Tags> tagsList = tagsService.findAll();
		// Lưu danh sách ArticleCategory vào Model
		model.addAttribute("articleCategoryList", articleCategoryList);
		// Lưu danh sách gameList vào Model
		model.addAttribute("gameList", gameList);
		// Lưu danh sách tagsList vào Model
		model.addAttribute("tagsList", tagsList);

		return "addarticles";
	}

	/*
	 * Phương thức Post lưu thông tin article vào cơ sở dữ liệu Đường đẫn :
	 * /admin/articles Trả Về : Redirect về trang admin/addarticles
	 */
	@PostMapping("/articles")
	public String addarticles(@RequestParam("title") String title, @RequestParam("slug") String slug,
			@RequestParam("articleCategories") List<Integer> articleCategoriesList,
			@RequestParam(value = "status", defaultValue = "inactive") String status, @RequestParam("isHot") int isHot,
			@RequestParam("subContent") String subContent, @RequestParam("mainContent") String mainContent,
			@RequestParam("author") String author, @RequestParam("allowComment") String allowComment,
			@RequestParam("gameId") Integer gameId, @RequestParam("tags") List<String> tagsList,
			@RequestParam("showDate") String showDate, Principal principal, @RequestParam("video") String video,
			@RequestParam("imagesThumbnail") MultipartFile imagesThumbnail, RedirectAttributes redirectAttributes,
			Model model

	) {
		System.out.println(mainContent);
		// Lấy chuỗi tháng, năm từ hàm getMonthAndYearNow() trong file ImagesManager
		String monthAndYear = imagesManager.getMonthAndYearNow();
		// Lấy đường dẫn /WEB-INF/files/images/articles/" + monthAndYear
		String photoPath = context.getRealPath("/WEB-INF/files/images/articles/" + monthAndYear);
		// Tạo mới một đối tượng article
		Article article = new Article();
		// Tạo mới HashSet có tên articleCategories
		HashSet<ArticleCategory> articleCategories = new HashSet<>();
		// Tạo mới HashSet có tên tagses
		HashSet<Tags> tagses = new HashSet<>();
		// Định dạng ngày có dạng yyyy-MM-dd'T'HH:mm
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

		try {
			// Set dữ liệu vào đối tượng tên article

			if (!title.equals("") && articleService.findByTitle(title) == null) {
				System.out.println(title);
				article.setTitle(HtmlUtils.htmlEscape(title));
			}
			if (!slug.equals("") && articleService.findBySlug(HtmlUtils.htmlEscape(slug)) == null) {
				System.out.println(slug);
				article.setSlug(HtmlUtils.htmlEscape(slug));
			}
			if (!subContent.equals("")) {
				article.setSubContent(HtmlUtils.htmlEscape(subContent));
			}
			if (!mainContent.equals("")) {
				article.setMainContent(HtmlUtils.htmlEscape(mainContent));
			}
			if (!author.equals("")) {
				System.out.println(author);
				article.setAuthor(HtmlUtils.htmlEscape(author));

			}



			if (!showDate.equals("")) {
				Date date = df.parse(showDate);
				article.setShowDate(date);

			} else {
				article.setShowDate(new Date());
			}



			if (!video.equals("")) {
				article.setVideo(video);
			}
			article.setStatus(status);
			article.setGameId(gameId);
			article.setViews(0);
			article.setCreatedDate(new Date());
			article.setIsHot((byte) isHot);
			article.setAllowComment(allowComment);

			// Vòng lặp dang sách articleCategoriesList và thêm một đối tượng
			// ArticleCategories vào HashSet articleCategories
			articleCategoriesList
					.forEach(x -> articleCategories.add(articleCategoryService.findByArticleCategoryId(x)));

			// Vòng lặp dang sách tagsList và thêm một đối tượng Tags vào HashSet tagses

			tagsList.forEach(x -> {

				if (tagsService.findByName(x) == null && tagsService.findBySlug(slugify.slugify(x)) == null) {
					Tags tagss = new Tags();
					tagss.setName(x);
					tagss.setSlug(slugify.slugify(x));
					System.out.println(x.getBytes());
					tagsService.saveorupdate(tagss);
				} else if (tagsService.findByName(x) == null && tagsService.findBySlug(slugify.slugify(x)) != null) {

					Tags tagss = new Tags();
					tagss.setName(x);
					tagss.setSlug(slugify.slugify(x) + "-" + tagsService.findBySlug(slugify.slugify(x)).getTagsId());
					System.out.println(
							"LLL" + slugify.slugify(x) + "-" + tagsService.findBySlug(slugify.slugify(x)).getTagsId());
					tagsService.saveorupdate(tagss);
				}

			});

			tagsList.forEach(x -> tagses.add(tagsService.findByName(x)));

			article.setArticleCategories(articleCategories);
			article.setTagses(tagses);
			article.setUsers(usersService.findByUserName(principal.getName()));
			// Kiểm tra nếu imagesThumbnail khác rỗng
			if (!imagesThumbnail.isEmpty()) {
				// Kiểm tra và tạo thư mục trong đường dẫn /WEB-INF/files/images/articles/" +
				// monthAndYear nêu chưa có
				boolean checkFolderExists = imagesManager.checkFolderExists(photoPath);
				if (checkFolderExists) {
					// Đổi tên File hiện tại
					String newNameFile = imagesManager.renameFile(imagesThumbnail.getOriginalFilename());
					// Lưu File vào đường dẫn
					byte[] bytes = imagesThumbnail.getBytes();
					Path path = Paths.get(photoPath + newNameFile);
					Files.write(path, bytes);

					article.setImagesThumbnail(monthAndYear + newNameFile);

				}

			}
			// Lưu đối tượng article vào cơ sở dữ liệu
			articleService.saveorupdate(article);

			redirectAttributes.addFlashAttribute("msg", "Thêm Bài Viết Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Thêm Bài Viết Thất Bại");
			redirectAttributes.addFlashAttribute("article", article);
			System.out.println(e.getMessage());
			System.out.println(e.getStackTrace());
			return "redirect:/admin/addarticles";
		}

		return "redirect:/admin/articles?status="+status;

	}

	@GetMapping("/articles/{articleId}")
	public String updateArticles(Model model, @PathVariable("articleId") Integer articleId

	) {

		Article article = articleService.findByArticleId(articleId);
		
		
		// Lấy danh sách ArticleCategory
		List<ArticleCategory> articleCategoryList = articleCategoryService.findAllByStatusOrderByArticleCategoryIdDesc("active");
		// Lấy danh sách Games
		List<Games> gameList = gamesService.findAllByStatusOrderByGameIdDesc("active");
		Games game = gamesService.findByGameId(article.getGameId());

		model.addAttribute("articleCategoryList", articleCategoryList);
		model.addAttribute("article", article);
		model.addAttribute("gameList", gameList);
		model.addAttribute("game", game);
		return "updatearticles";
	}

	@PatchMapping("/articles")
	public String updateArticle(@RequestParam("articleId") Integer articleId, @RequestParam("title") String title,
			@RequestParam("slug") String slug, @RequestParam("articleCategories") List<Integer> articleCategoriesList,
			@RequestParam(value = "status", defaultValue = "inactive") String status, @RequestParam("isHot") int isHot,
			@RequestParam("subContent") String subContent, @RequestParam("mainContent") String mainContent,
			@RequestParam("author") String author, @RequestParam("allowComment") String allowComment,
			@RequestParam("gameId") Integer gameId, @RequestParam("tags") List<String> tagsList,
			@RequestParam("showDate") String showDate, Principal princial, @RequestParam("video") String video,
			@RequestParam("imagesThumbnail") MultipartFile imagesThumbnail, RedirectAttributes redirectAttributes,
			HttpServletRequest request,
			Model model) {

		// Lấy chuỗi tháng, năm từ hàm getMonthAndYearNow() trong file ImagesManager
		String monthAndYear = imagesManager.getMonthAndYearNow();
		// Lấy đường dẫn /WEB-INF/files/images/articles/" + monthAndYear
		String photoPath = context.getRealPath("/WEB-INF/files/images/articles/" + monthAndYear);

		Article article = articleService.findByArticleId(articleId);
		// Tạo mới HashSet có tên articleCategories
		HashSet<ArticleCategory> articleCategories = new HashSet<>();
		// Tạo mới HashSet có tên tagses
		HashSet<Tags> tagses = new HashSet<>();
		// Định dạng ngày có dạng yyyy-MM-dd'T'HH:mm
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

		try {
			// Set dữ liệu vào đối tượng tên article

			if (!title.equals("") && articleService.findByTitle(title) == null) {
				System.out.println(title);
				article.setTitle(HtmlUtils.htmlEscape(title));
			}
			if (!slug.equals("") && articleService.findBySlug(HtmlUtils.htmlEscape(slug)) == null) {
				System.out.println(slug);
				article.setSlug(HtmlUtils.htmlEscape(slug));
			}
			if (!subContent.equals("")) {
				article.setSubContent(HtmlUtils.htmlEscape(subContent));
			}
			if (!mainContent.equals("")) {
				article.setMainContent(HtmlUtils.htmlEscape(mainContent));
			}
			if (!author.equals("")) {
				System.out.println(author);
				article.setAuthor(HtmlUtils.htmlEscape(author));

			}
			if(request.isUserInRole("ROLE_ADMIN")){

				article.setStatus(status);
			}
			if (!showDate.equals("")) {
				Date date = df.parse(showDate);
				article.setShowDate(date);

			} else {
				article.setShowDate(new Date());
			}

			if (!video.equals("")) {
				article.setVideo(video);
			}
			article.setViews(0);
			article.setCreatedDate(new Date());
			article.setIsHot((byte) isHot);
			article.setAllowComment(allowComment);
			article.setGameId(gameId);
			// Vòng lặp dang sách articleCategoriesList và thêm một đối tượng
			// ArticleCategories vào HashSet articleCategories
			articleCategoriesList
					.forEach(x -> articleCategories.add(articleCategoryService.findByArticleCategoryId(x)));

			// Vòng lặp dang sách tagsList và thêm một đối tượng Tags vào HashSet tagses

			tagsList.forEach(x -> {
				if (tagsService.findByName(x) == null && tagsService.findBySlug(slugify.slugify(x)) == null) {
					Tags tagss = new Tags();
					tagss.setName(x);
					tagss.setSlug(slugify.slugify(x));

					tagsService.saveorupdate(tagss);
				} else if (tagsService.findByName(x) == null && tagsService.findBySlug(slugify.slugify(x)) != null) {

					Tags tagss = new Tags();
					tagss.setName(x);
					tagss.setSlug(slugify.slugify(x) + "-" + tagsService.findBySlug(slugify.slugify(x)).getTagsId());
					tagsService.saveorupdate(tagss);
				}

			});

			tagsList.forEach(x -> tagses.add(tagsService.findByName(x)));

			article.setArticleCategories(articleCategories);
			article.setTagses(tagses);
			article.setModifiedUserId(usersService.findByUserName(princial.getName()).getUserId());
			article.setModifiedDate(new Date());
			// Kiểm tra nếu imagesThumbnail khác rỗng
			if (!imagesThumbnail.isEmpty()
					&& !imagesThumbnail.getOriginalFilename().equals(article.getImagesThumbnail())) {
				// Kiểm tra và tạo thư mục trong đường dẫn /WEB-INF/files/images/articles/" +
				// monthAndYear nêu chưa có
				boolean checkFolderExists = imagesManager.checkFolderExists(photoPath);
				if (checkFolderExists) {
					// Đổi tên File hiện tại
					String newNameFile = imagesManager.renameFile(imagesThumbnail.getOriginalFilename());
					// Lưu File vào đường dẫn
					byte[] bytes = imagesThumbnail.getBytes();
					Path path = Paths.get(photoPath + newNameFile);
					Files.write(path, bytes);

					article.setImagesThumbnail(monthAndYear + newNameFile);

				}

			}
			// Lưu đối tượng article vào cơ sở dữ liệu
			articleService.saveorupdate(article);

			redirectAttributes.addFlashAttribute("msg", "Sửa Bài Viết Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Sửa Bài Viết Thất Bại");
			redirectAttributes.addFlashAttribute("article", article);
			System.out.println(e.getMessage());
			System.out.println(e.getStackTrace());
			return "redirect:/admin/updatearticles/" + articleId;
		}

		return "redirect:/admin/articles?status="+article.getStatus();
	}

	@DeleteMapping("/articles")
	public String deleteAllUser(@RequestParam("arrayId") List<Integer> arrayId, RedirectAttributes redirectAttributes) {

		try {
			arrayId.forEach(x -> {
				System.out.println("ID XOA :" + x);
				Article article = articleService.findByArticleId(x);
				article.setStatus("deleted");
				articleService.saveorupdate(article);

			});

			redirectAttributes.addFlashAttribute("msg", "Xóa Bài Viết Thành Công");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("msg", "Xóa Bài Viết Thất Bại");
		}

		return "redirect:/admin/articles?status=active";
	}
}
