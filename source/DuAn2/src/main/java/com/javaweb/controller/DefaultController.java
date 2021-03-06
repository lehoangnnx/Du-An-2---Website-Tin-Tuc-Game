/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 15/11/2017
* */
package com.javaweb.controller;

import com.javaweb.model.*;
import com.javaweb.service.*;


import org.apache.commons.lang3.math.NumberUtils;
import org.omg.IOP.ServiceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;


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
    @Autowired
    GameCategoryService gameCategoryService;
    @Autowired
    TagsService tagsService;
    @Autowired
    GameReviewsService gameReviewsService;
    @Autowired
    CommentService commentService;
    @Autowired
    ArticleLikeService articleLikeService;
    @Autowired
    ServletContext servletContext;

    @ModelAttribute("user")
    // Lưu Session Thông tin người dùng đăng nhập
    public void sessionUser(Authentication authentication, HttpSession session) {
        if (authentication != null) {
            System.out.println("Đây Hả"+authentication.getAuthorities());
            session.setAttribute("user", usersService.findByUserName(authentication.getName()));

        }
    }

    @RequestMapping(value = {"/", "/home"})
    public String index(Model model) {
    	
        /*
        * Lấy danh mục bài viết từ cơ sở dữ liệu có tên là Video
        * Đầu vào : Tên danh mục
        * Đầu ra : Danh mục bài viết
        * */
        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByArticleCategoryId(20);
        model.addAttribute("getArticleCategoryVideo", getArticleCategoryVideo);

        /*
        * Lấy danh danh sách 10 bài viết có danh mục là Video thuộc tính isHot = 1, trạng thái là active và có ngày hiển thị nhỏ hơn ngày hiện tại
        *  Đầu vào :danh mục bài viết isHot = 1 , status = active , showDate < ngày hiện tại
        * Đầu ra : Danh sách 10 bài viết
        * */
        List<Article> getTop10ArticleCategoryNewAndHotVideoList = articleService
                .findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
                        (getArticleCategoryVideo, (byte) 1, "active", new Date());
        model.addAttribute("getTop10ArticleCategoryNewAndHotVideoList", getTop10ArticleCategoryNewAndHotVideoList);

        /*
        * Lấy danh mục bài viết từ cơ sở dữ liệu có tên là Sự Kiện
        * Đầu vào : Tên danh mục
        * Đầu ra : Danh mục bài viết
        * */
        ArticleCategory getArticleCategorySuKien = articleCategoryService.findByArticleCategoryId(24);
        model.addAttribute("articlesCategorySuKien", getArticleCategorySuKien);
        /*
        * Lấy danh danh sách 5 bài viết có danh mục bài viết là Sự Kiện và trạng thái là active
        *  Đầu vào : danh mục bài viết , trạng thái
        * Đầu ra : Danh sách 5 bài viết
        * */
        List<Article> getTop5ArticleCategoryNewSuKienList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategorySuKien, "active");
        model.addAttribute("getTop5ArticleCategoryNewSuKienList", getTop5ArticleCategoryNewSuKienList);

        /*
        * Lấy danh danh sách 10 bài viết có trạng thái là active,showDate nhỏ hơn ngày hiện tại và
        * sắp xếp giảm dần theo showDate
        *  Đầu vào : trạng thái, ngày hiện tại
        * Đầu ra : Danh sách 10 bài viết
        * */
        List<Article> getTop10ArticleList = articleService
                .findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc("active", new Date());
        model.addAttribute("getTop10ArticleList", getTop10ArticleList);

         /*
        * Lấy danh mục game từ cơ sở dữ liệu có tên là Game Pc-Console
        * Đầu vào : Tên danh mục game
        * Đầu ra : Danh mục game
        * */
        GameCategory gameCategoryPcConsole = gameCategoryService.findByGameCategoryId(7);
        model.addAttribute("gameCategoryPcConsole", gameCategoryPcConsole);
        /*
        * Lấy danh danh sách 3 Game có danh mục game là Pc-Console , trạng thái là active và isHot = 1
        *  Đầu vào : trạng thái, isHot
        * Đầu ra : Danh sách 3 Game
        * */
        List<Games> getTop3GamePcConsole = gamesService
                .findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategoryPcConsole, (byte) 1, "active")
                .stream().limit(3).collect(Collectors.toList());
        model.addAttribute("getTop3GamePcConsole", getTop3GamePcConsole);

         /*
        * Lấy danh mục game từ cơ sở dữ liệu có tên là Game Esport
        * Đầu vào : Tên danh mục game
        * Đầu ra : Danh mục game
        * */
        GameCategory gameCategoryEsport = gameCategoryService.findByGameCategoryId(9);
        model.addAttribute("gameCategoryEsport", gameCategoryEsport);
        /*
        * Lấy danh danh sách 3 Game có danh mục game là Esport , trạng thái là active và isHot = 1
        *  Đầu vào : danh mục game, trạng thái, isHot
        * Đầu ra : Danh sách 3 Game
        * */
        List<Games> getTop3GameEsport = gamesService
                .findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategoryEsport, (byte) 1, "active")
                .stream().limit(3).collect(Collectors.toList());
        model.addAttribute("getTop3GameEsport", getTop3GameEsport);

         /*
        * Lấy danh mục game từ cơ sở dữ liệu có tên là Game Mobile
        * Đầu vào : Tên danh mục game
        * Đầu ra : Danh mục game
        * */
        GameCategory gameCategoryMobile = gameCategoryService.findByGameCategoryId(8);
        model.addAttribute("gameCategoryMobile", gameCategoryMobile);
        /*
        * Lấy danh danh sách 3 Game có danh mục game là Mobile , trạng thái là active và isHot = 1
        *  Đầu vào : danh mục game, trạng thái, isHot
        * Đầu ra : Danh sách 3 Game
        * */
        List<Games> getTop3GameMobile = gamesService
                .findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategoryMobile, (byte) 1, "active")
                .stream().limit(3).collect(Collectors.toList());
        model.addAttribute("getTop3GameMobile", getTop3GameMobile);

        model.addAttribute("title", "Website Game24h");
        return "home";
    }


    @ModelAttribute("getTop5ArticleCategoryHotVideoList")
    public List<Article> getTop5ArticleCategoryHotVideoList(Model model) {
        /*
        * Lấy danh mục bài viết từ cơ sở dữ liệu có tên là Video
        * Đầu vào : Tên danh mục
        * Đầu ra : Danh mục bài viết
        * */
        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByArticleCategoryId(20);
        model.addAttribute("getArticleCategoryVideo", getArticleCategoryVideo);
         /*
        * Lấy danh danh sách 5 bài viết có danh mục là Video thuộc tính isHot = 1, trạng thái là active và có ngày hiển thị nhỏ hơn ngày hiện tại
        * sắp xếp giảm dần thuộc tính Views
        *  Đầu vào :danh mục bài viết isHot = 1 , status = active , showDate < ngày hiện tại
        * Đầu ra : Danh sách 5 bài viết
        * */
        List<Article> getTop5ArticleCategoryHotVideoList = articleService
                .findTop5ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc(getArticleCategoryVideo, "active", new Date());
        return getTop5ArticleCategoryHotVideoList;
    }

    @ModelAttribute("getTop10HotArticle")
    public List<Article> getTop10HotArticle() {
         /*
        * Lấy danh mục bài viết từ cơ sở dữ liệu có tên là Video
        * Đầu vào : Tên danh mục
        * Đầu ra : Danh mục bài viết
        * */
        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByArticleCategoryId(20);

        /*
        * Lấy danh danh sách 10 bài viết có danh mục khác Video thuộc tính isHot = 1, trạng thái là active
        * sắp xếp giảm dần thuộc tính Views
        *  Đầu vào :danh mục bài viết, isHot = 1 , status = active
        * Đầu ra : Danh sách 10 bài viết
        * */
        List<Article> getTop10HotArticle = articleService.findTop10ByIsHotAndStatusOrderByViewsDesc((byte) 1, "active")
                .stream().filter(x -> x.getArticleCategories() != getArticleCategoryVideo)
                .limit(5)
                .collect(Collectors.toList());
        return getTop10HotArticle;
    }

    @ModelAttribute("getTop10NewGame")
    public List<Games> getTop10NewGame() {

        /*
        * Lấy danh danh sách 10 game có  trạng thái là active
        *  Đầu vào : status = active
        * Đầu ra : Danh sách 10 game
        * */
        List<Games> getTop10NewGame = gamesService.findTop10ByStatusOrderByReleasesDesc("active")
                .stream().limit(5).collect(Collectors.toList());
        return getTop10NewGame;
    }

    @ModelAttribute("getTop10HotGame")
    public List<Games> getTop10HotGame() {
        /*
        * Lấy danh danh sách 10 game có  trạng thái là active, isHot = 1
        *  Đầu vào : status = active, isHot = 1
        * Đầu ra : Danh sách 10 game
        * */
        List<Games> getTop10HotGame = gamesService.findTop10ByIsHotAndStatusOrderByReleasesDesc((byte) 1, "active")
                .stream().limit(5).collect(Collectors.toList());
        return getTop10HotGame;
    }

    @ModelAttribute("getTop10GameOnline")
    public List<Games> getTop10GameOnline(Model model) {
          /*
        * Lấy danh mục game từ cơ sở dữ liệu có tên là Game Online
        * Đầu vào : Tên danh mục game
        * Đầu ra : Danh mục game
        * */
        GameCategory gameCategory = gameCategoryService.findByGameCategoryId(5);
        model.addAttribute("gameCategoryGameOnline", gameCategory);
        /*
        * Lấy danh danh sách 10 game có danh mục game là  Game Online,  trạng thái là active, isHot = 1
        *  Đầu vào : danh mục game, status = active, isHot = 1
        * Đầu ra : Danh sách 10 game
        * */
        List<Games> getTop10GameOnline = gamesService.findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc
                (gameCategory, (byte) 1, "active")
                .stream().limit(5).collect(Collectors.toList());
        return getTop10GameOnline;
    }

    @ModelAttribute("getTop10GameOffline")
    public List<Games> getTop10GameOffline(Model model) {
          /*
        * Lấy danh mục game từ cơ sở dữ liệu có tên là Game Offline
        * Đầu vào : Tên danh mục game
        * Đầu ra : Danh mục game
        * */
        GameCategory gameCategory = gameCategoryService.findByGameCategoryId(6);
        model.addAttribute("gameCategoryGameOffline", gameCategory);
         /*
        * Lấy danh danh sách 10 game có danh mục game là  Game Offline,  trạng thái là active, isHot = 1
        *  Đầu vào : danh mục game, status = active, isHot = 1
        * Đầu ra : Danh sách 10 game
        * */
        List<Games> getTop10GameOffline = gamesService.findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc
                (gameCategory, (byte) 1, "active")
                .stream().limit(5).collect(Collectors.toList());
        return getTop10GameOffline;
    }

    @ModelAttribute("getTop5ArticleHotAndViews")
    public List<Article> getTop5ArticleHotAndViews() {
        /*
        * Lấy danh danh sách 5 bài viết có isHot = 1, trạng thái là active
        * sắp xếp giảm dần thuộc tính Views
        *  Đầu vào :isHot = 1 , status = active
        * Đầu ra : Danh sách 5 bài viết
        * */
        List<Article> getTop5ArticleHotAndViews = articleService.findTop5ByIsHotAndStatusOrderByViewsDesc
                ((byte) 1, "active");
        return getTop5ArticleHotAndViews;
    }

    @ModelAttribute("getTop10ArticleCategoryNewReviewsList")
    public List<Article> getTop10ArticleCategoryNewReviewsList(Model model) {
    	// Lấy danh mục bài viết có tên Reivews
        ArticleCategory getArticleCategoryReviews = articleCategoryService.findByArticleCategoryId(21);
        model.addAttribute("getArticleCategoryReviews", getArticleCategoryReviews);
        List<Article> getTop10ArticleCategoryNewReviewsList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategoryReviews, "active")
                .stream().limit(5).collect(Collectors.toList());
        return getTop10ArticleCategoryNewReviewsList;
    }

    @ModelAttribute("getTop10ArticleCategoryNewTienIchList")
    public List<Article> getTop10ArticleCategoryNewTienIchList(Model model) {
    	// Lấy danh mục bài viết có tên Tiện ích
        ArticleCategory getArticleCategoryTienIch = articleCategoryService.findByArticleCategoryId(22);
        model.addAttribute("getArticleCategoryTienIch", getArticleCategoryTienIch);
        List<Article> getTop10ArticleCategoryNewTienIchList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategoryTienIch, "active")
                .stream().limit(5).collect(Collectors.toList());
        return getTop10ArticleCategoryNewTienIchList;
    }

    @ModelAttribute("getTop10ArticleCategoryNewThuThuatList")
    public List<Article> getTop10ArticleCategoryNewThuThuatList(Model model) {
    	// Lấy danh mục bài viết có tên Thủ Thuật
        ArticleCategory getArticleCategoryThuThuat = articleCategoryService.findByArticleCategoryId(23);
        model.addAttribute("getArticleCategoryThuThuat", getArticleCategoryThuThuat);
        List<Article> getTop10ArticleCategoryNewThuThuatList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategoryThuThuat, "active")
                .stream().limit(5).collect(Collectors.toList());
        return getTop10ArticleCategoryNewThuThuatList;
    }

    @ModelAttribute("getTop10ArticleHotAndNewGamingGearList")
    public List<Article> getTop10ArticleHotAndNewGamingGearList() {
    	// Lấy danh mục bài viết có tên Gaming Gear
        ArticleCategory getArticleCategoryGamingGear = articleCategoryService.findByArticleCategoryId(18);

        List<Article> getTop10ArticleHotAndNewGamingGearList = articleService
                .findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
                        (getArticleCategoryGamingGear,(byte) 1, "active", new Date())
                .stream().limit(5).collect(Collectors.toList());
        return getTop10ArticleHotAndNewGamingGearList;
    }
    @ModelAttribute("getTop10ArticleHotAndNewMangaFilmList")
    public List<Article> getTop10ArticleHotAndNewMangaFilm() {
    	// Lấy danh mục bài viết có tên Manga/Film
        ArticleCategory getArticleCategoryMangaFilm = articleCategoryService.findByArticleCategoryId(19);

        List<Article> getTop10ArticleHotAndNewMangaFilmList = articleService
                .findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
                        (getArticleCategoryMangaFilm,(byte) 1, "active", new Date())
                .stream().limit(5).collect(Collectors.toList());
        return getTop10ArticleHotAndNewMangaFilmList;
    }
    @ModelAttribute("getTop10ArticleHotAndNewReviewsList")
    public List<Article> getTop10ArticleHotAndNewReviewsList() {
    	// Lấy danh mục bài viết có tên Review
        ArticleCategory getArticleCategoryReviews = articleCategoryService.findByArticleCategoryId(21);

        List<Article> getTop10ArticleHotAndNewReviewsList = articleService
                .findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
                        (getArticleCategoryReviews,(byte) 1, "active", new Date())
                .stream().limit(5).collect(Collectors.toList());
        return getTop10ArticleHotAndNewReviewsList;
    }
    @ModelAttribute("getTop20TagsList")
    public List<Tags> getTop20TagsList() {
        List<Tags> getTop20TagsList = tagsService.findAll().stream().limit(20).collect(Collectors.toList());
        return getTop20TagsList;
    }

    @ModelAttribute("articleCategoryList")
    public List<ArticleCategory> getCategory() {
        List<ArticleCategory> articleCategoryList = articleCategoryService.findAllByStatusOrderBySortOrderAsc("active");

        return articleCategoryList;

    }

    @ModelAttribute("gamesCategoryList")
    public List<GameCategory> gamesCategoryList() {
    	//Lấy danh sách danh mục bài viết
        List<GameCategory> articleCategoryList = gameCategoryService.findAllByStatusOrderBySortOrderDesc("active");

        return articleCategoryList;

    }


    @RequestMapping("/{slug}.html")
   // Hiển thị chi tiết bài viết
    String chitiet(@PathVariable("slug") String slug, Model model,HttpServletRequest request,
                   @RequestParam(value = "page", defaultValue = "1") String stpage,
                   @RequestParam(value = "limit", defaultValue = "15") String stlimit
            , @RequestParam(value = "sorted", defaultValue = "news") String sorted, Authentication authentication
    ) {

        Article article = null;
        ArticleCategory articleCategory = null;
        Tags tags = null;
        Games games = null;
        model.addAttribute("sorted", "sorted=" + sorted);
        int limit =15;
        int page = 1;
        if (sorted.equals("news")) {
            sorted = "showDate";
        }
        else if (sorted.equals("hots")) {
            sorted = "views";
        }else {
            sorted = "showDate";
        }
        try {
            limit = Integer.parseInt(stlimit);
        }catch (NumberFormatException e){
            limit = 15;
        }
        try {
            page = Integer.parseInt(stpage);
        }catch (NumberFormatException e){
            page = 1;
        }
        try {
            article = articleService.findBySlug(HtmlUtils.htmlEscape(slug));
            articleCategory = articleCategoryService.findBySlug(HtmlUtils.htmlEscape(slug));

            tags = tagsService.findBySlug(HtmlUtils.htmlEscape(slug));
            List<Article> articleList = null;

            if (article != null) {


                article.setMainContent(HtmlUtils.htmlUnescape(article.getMainContent()));
                ArticleCategory getarticleCategory = null;


                for (ArticleCategory a : article.getArticleCategories()) {

                    getarticleCategory = articleCategoryService.findByArticleCategoryId(a.getArticleCategoryId());

                }
                Integer articleId = article.getArticleId();
                List<Article> articleLienQuanList = articleService
                        .findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc(getarticleCategory, (byte) 1, "active", new Date())
                        .stream().filter(x-> !x.getArticleId().equals(articleId)).collect(Collectors.toList());

                List<Comment> getTop10Comment = commentService.findTop10ByStatusOrderByCreatedDateDesc("active");
                List<Article> getTop10ArticleList = articleService
                        .findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc("active", new Date())
                        .stream().filter(x-> !x.getArticleId().equals(articleId)).collect(Collectors.toList());
                model.addAttribute("getTop10ArticleList", getTop10ArticleList);
                model.addAttribute("getTop10Comment", getTop10Comment);
                model.addAttribute("article", article);

                model.addAttribute("articleCategory", getarticleCategory);
                model.addAttribute("articleLienQuanList", articleLienQuanList);
                model.addAttribute("title", article.getTitle());
                article.setViews(article.getViews() + 1);
                articleService.saveorupdate(article);


                int pointGameReviews = 0;
                int pointGameReviewsOfUser = 0;
                if (article.getGameId() != 0) {
                    games = gamesService.findByGameIdAndStatus(article.getGameId(),"active");
                    if (!gameReviewsService.findAllByGames(games).isEmpty()) {
                        List<GameReviews> gameReviewsList = gameReviewsService.findAllByGames(games);
                        for (GameReviews g : gameReviewsList) {
                            pointGameReviews = pointGameReviews + (int) g.getReview();

                            if (authentication != null) {
                                Users users = usersService.findByUserName(authentication.getName());
                                if (g.getUsers().getUserId() == users.getUserId()) {
                                    pointGameReviewsOfUser = (int) g.getReview();
                                }
                            }

                        }

                        model.addAttribute("pointGameReviews", pointGameReviews / gameReviewsList.size());
                        model.addAttribute("pointGameReviewsOfUser", pointGameReviewsOfUser);
                    }
                    model.addAttribute("games", games);
                }

                List<ArticleLike> articleLikeList = articleLikeService.findAllByArticle(article);
                boolean userOfArticleLike = false;
                for (ArticleLike al : articleLikeList) {
                    if (authentication != null) {
                        if (al.getUsers() == usersService.findByUserName(authentication.getName())) {
                            userOfArticleLike = true;
                            break;
                        }
                    }


                }
                model.addAttribute("articleLikeList", articleLikeList);
                model.addAttribute("userOfArticleLike", userOfArticleLike);

                return "chitiet";
            } else if (articleCategory != null) {
                if (articleCategory.getArticleCategoryId().equals(20)) {
                    List<Article> getTop10ArticleCategoryNewVideoList = articleService
                            .findTop10ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc(articleCategory, "active", new Date());

                    model.addAttribute("getTop10ArticleCategoryNewVideoList", getTop10ArticleCategoryNewVideoList);
                }

                articleList = articleService
                        .findAllByArticleCategoriesAndStatusAndShowDateBefore(articleCategory, "active", new Date(), null);

                int pageCount = (articleList.size()) / limit + (articleList.size() % limit > 0 ? 1 : 0);
                articleList = articleService
                        .findAllByArticleCategoriesAndStatusAndShowDateBefore(articleCategory, "active", new Date(),
                                new PageRequest(page - 1, limit, new Sort(Sort.Direction.DESC, sorted)));
                model.addAttribute("objectCategoryAndTag", articleCategory);
                model.addAttribute("articleList", articleList);

                model.addAttribute("currentpage", page);
                model.addAttribute("pagecount", pageCount);
                model.addAttribute("title", articleCategory.getName());
                return "tonghop";
            } else if (tags != null) {
                articleList = articleService
                        .findAllByTagsesAndStatusAndShowDateBefore(tags, "active", new Date(), null);
                int pageCount = (articleList.size()) / limit + (articleList.size() % limit > 0 ? 1 : 0);
                articleList = articleService
                        .findAllByTagsesAndStatusAndShowDateBefore(tags, "active", new Date(),
                                new PageRequest(page - 1, limit, new Sort(Sort.Direction.DESC, sorted)));

                model.addAttribute("objectCategoryAndTag", tags);
                model.addAttribute("articleList", articleList);

                model.addAttribute("currentpage", page);
                model.addAttribute("pagecount", pageCount);
                model.addAttribute("title", tags.getName());
                return "tonghop";
            } else if (slug.equals("articles")) {

                articleList = articleService.findAllByStatusAndShowDateBefore
                        ("active", new Date(), null);
                int pageCount = (articleList.size()) / limit + (articleList.size() % limit > 0 ? 1 : 0);
                articleList = articleService.findAllByStatusAndShowDateBefore("active", new Date(),
                        new PageRequest(page - 1, limit, new Sort(Sort.Direction.DESC, sorted)));
                Map<String, String> objectCategoryAndTagMap = new HashMap<>();
                objectCategoryAndTagMap.put("name", "Tin Mới");
                objectCategoryAndTagMap.put("slug", "articles");

                model.addAttribute("objectCategoryAndTag", objectCategoryAndTagMap);
                model.addAttribute("articleList", articleList);

                model.addAttribute("currentpage", page);
                model.addAttribute("pagecount", pageCount);
                model.addAttribute("title", "Tin Mới");

                return "tonghop";
            } else {
                model.addAttribute("title", "Trang Thông Báo Lỗi 404");
                return "redirect:/403.html";
            }

        } catch (Exception e) {
            model.addAttribute("title", "Trang Thông Báo Lỗi 404");
            System.out.println(e.getMessage());
            return "redirect:/403.html";
        }


    }




    @RequestMapping("/search.html")
    // Hiển thị trang tìm kiếm
    String search(Model model, @RequestParam("q") String q,
                  @RequestParam(value = "page", defaultValue = "1") String stpage,
                  @RequestParam(value = "limit", defaultValue = "15") String stlimit
            , @RequestParam(value = "sorted", defaultValue = "hots") String sorted) {
        String keywork = HtmlUtils.htmlEscape(q);
        Map<String, String> objectCategoryAndTagMap = new HashMap<>();
        List<Article> articleList = null;
        ArticleCategory articleCategory = null;
        Tags tags = null;
        
        model.addAttribute("sorted", "sorted=" + sorted);
        int limit =15;
        int page = 1;
        if (sorted.equals("news")) {
            sorted = "showDate";
        }
        else if (sorted.equals("hots")) {
            sorted = "views";
        }else {
            sorted = "showDate";
        }
        try {
            limit = Integer.parseInt(stlimit);
        }catch (NumberFormatException e){
            limit = 15;
        }
        try {
            page = Integer.parseInt(stpage);
        }catch (NumberFormatException e){
            page = 1;
        }
        try {
            // Lấy danh sách danh mục bài viết theo tên và đường dẫn
            articleCategory = articleCategoryService.findTop1ByNameContainingOrSlugContainingAndStatus
                    (keywork, keywork, "active");

            // Lấy danh sách tag bài viết theo tên và đường dẫn
            tags = tagsService.findTop1ByNameContainingOrSlugContaining(keywork, keywork);

            // Lấy danh sách bài viết theo tên và đường dẫn
            articleList = articleService.findDistinctAllByTitleContainingOrSlugContainingOrSubContentContainingOrMainContentOrAuthorContainingOrArticleCategoriesOrTagsesAndStatusAndShowDateBeforeOrderByViewsDesc
                    (keywork, keywork, keywork, keywork, keywork, articleCategory, tags, "active", new Date(), null);

            int pageCount = (articleList.size()) / limit + (articleList.size() % limit > 0 ? 1 : 0);
            int totalArticle = articleList.size();
            articleList = articleService.findDistinctAllByTitleContainingOrSlugContainingOrSubContentContainingOrMainContentOrAuthorContainingOrArticleCategoriesOrTagsesAndStatusAndShowDateBeforeOrderByViewsDesc
                    (keywork, keywork, keywork, keywork, keywork, articleCategory, tags, "active", new Date(),
                            new PageRequest(page - 1, limit, new Sort(Sort.Direction.DESC, sorted)));
            if (articleList.size() != 0) {
                objectCategoryAndTagMap.put("name", "Kết Quả Tìm Kiếm : " + totalArticle + " Kết Quả");
                objectCategoryAndTagMap.put("slug", "search.html?q=" + q);
                model.addAttribute("objectCategoryAndTag", objectCategoryAndTagMap);
                model.addAttribute("title", q);
                model.addAttribute("articleList", articleList);
                model.addAttribute("currentpage", page);
                model.addAttribute("pagecount", pageCount);
            } else {
                objectCategoryAndTagMap.put("name", "Không Tìm Thấy Kết Quả Nào");
                objectCategoryAndTagMap.put("slug", "search.html?q=" + q);
                model.addAttribute("objectCategoryAndTag", objectCategoryAndTagMap);
            }
            return "search";
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/403.html";
        }


    }


    @GetMapping("/profile.html")
    // Hiển thị trang thông tin cá nhân
    public String profile(Authentication authentication, Model model) {
        try {
            if (authentication != null) {


                model.addAttribute("title", "Trang Cá Nhân");
                return "canhan";
            } else {
                return "redirect:/403.html";
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/403.html";
        }

    }
    @RequestMapping("/403.html")
    // Hiển thị trang thông báo lỗi
    String error(Model model) {


        model.addAttribute("title", "Trang Thông Báo Lỗi 404");
        return "403";
    }
    
    
}
