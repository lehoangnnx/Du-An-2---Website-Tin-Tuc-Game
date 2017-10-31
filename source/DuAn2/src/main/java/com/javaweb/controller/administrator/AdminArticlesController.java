package com.javaweb.controller.administrator;

import com.javaweb.controller.ImagesManager;
import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.model.Games;
import com.javaweb.model.Tags;
import com.javaweb.model.Users;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;
/*
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.httpBasic;*/

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

	/*
	 * Phương thức Get hiển thi trang articles Đường đẫn : /admin/article Trả Về :
	 * Tên articles trong file layout-administrator-tiles.xml cấu hình Apache Tiles
	 */
	@GetMapping("/articles")
	public String getAllArticles(Model model) {
		// Lấy danh sách Article
		List<Article> articleList = articleService.findAll().stream()
				.sorted(Comparator.comparing(Article::getCreatedDate).reversed()).collect(Collectors.toList());
		// articleList.sort(( a1, a2) ->
		// a1.getCreatedDate().compareTo(a2.getCreatedDate()));

		for (int i = 0; i < articleList.size(); i++) {
			System.out.println(i + "-" + articleList.get(i).getTitle());
		}
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
		List<ArticleCategory> articleCategoryList = articleCategoryService.findAll();
		// Lấy danh sách Games
		List<Games> gameList = gamesService.findAll();
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
			@RequestParam("status") String status, @RequestParam("isHot") int isHot,
			@RequestParam("subContent") String subContent, @RequestParam("mainContent")  String mainContent,
			@RequestParam("author") String author, @RequestParam("gameId") Integer gameId,
			@RequestParam("tags") List<Integer> tagsList, @RequestParam("showDate") String showDate, Principal princial,
			@RequestParam("video") String video, @RequestParam("imagesThumbnail") MultipartFile imagesThumbnail,
			RedirectAttributes redirectAttributes, Model model

	) {

		System.out.println("NAME :" + princial.getName());
		Users u = usersService.findByUserName(princial.getName());
		System.out.println("ID" + u.getUserId() + u.getEmail());
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
		Article findByTitle = null;
		Article findBySlug = null;
		try {
			// Set dữ liệu vào đối tượng tên article

			findByTitle = articleService.findByTitle(title);
			findBySlug = articleService.findBySlug(slug);
			if (!title.equals("") && findByTitle == null) {
				System.out.println(title);
				article.setTitle(HtmlUtils.htmlEscape(title));
			}
			if (!slug.equals("") && findBySlug == null) {
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
			if (!status.equals("")) {
				article.setStatus(status);
			}
			if (!showDate.equals("")) {
				Date date = df.parse(showDate);
				article.setShowDate(date);

			}
			article.setViews(0);
			article.setCreatedDate(new Date());
			article.setIsHot((byte) isHot);
			article.setVideo(video);
			article.setGameId(gameId);
			// Vòng lặp dang sách articleCategoriesList và thêm một đối tượng
			// ArticleCategories vào HashSet articleCategories
			articleCategoriesList
					.forEach(x -> articleCategories.add(articleCategoryService.findByArticleCategoryId(x)));
			// Vòng lặp dang sách tagsList và thêm một đối tượng Tags vào HashSet tagses
			tagsList.forEach(x -> tagses.add(tagsService.findTagsId(x)));

			article.setArticleCategories(articleCategories);
			article.setTagses(tagses);
			article.setUsers(usersService.findByUserName(princial.getName()));
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

		return "redirect:/admin/articles";
	}
}
