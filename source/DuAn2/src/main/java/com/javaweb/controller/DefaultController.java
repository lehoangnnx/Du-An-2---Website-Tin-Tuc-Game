/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 15/11/2017
* */
package com.javaweb.controller;

import com.javaweb.model.*;
import com.javaweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


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


    @ModelAttribute("user")
    // Lưu Session Thông tin người dùng đăng nhập
    public void sessionUser(Authentication authentication, HttpSession session) {
        if (authentication != null) {
            System.out.println(authentication.getAuthorities());
            session.setAttribute("user", usersService.findByUserName(authentication.getName()));

        }
    }

    @RequestMapping(value = {"/", "/home"})
    public String index(Model model

    ) {
        /*
        * Lấy danh mục bài viết từ cơ sở dữ liệu có tên là Video
        * Đầu vào : Tên danh mục
        * Đầu ra : Danh mục bài viết
        * */
        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
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
        ArticleCategory getArticleCategorySuKien = articleCategoryService.findByName("Sự Kiện");

        /*
        * Lấy danh danh sách 5 bài viết có danh mục bài viết là Sự Kiện và trạng thái là active
        *  Đầu vào : danh mục bài viết , trạng thái
        * Đầu ra : Danh sách 5 bài viết
        * */
        List<Article> getTop5ArticleCategoryNewSuKienList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategorySuKien, "active")
                .stream().limit(5).collect(Collectors.toList());
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
        GameCategory gameCategoryPcConsole = gameCategoryService.findByName("Game Pc-Console");

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
        GameCategory gameCategoryEsport = gameCategoryService.findByName("Game Esport");

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
        GameCategory gameCategoryMobile = gameCategoryService.findByName("Game Mobile");

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
    public List<Article> getTop5ArticleCategoryHotVideoList() {
        /*
        * Lấy danh mục bài viết từ cơ sở dữ liệu có tên là Video
        * Đầu vào : Tên danh mục
        * Đầu ra : Danh mục bài viết
        * */
        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
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
        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");

        /*
        * Lấy danh danh sách 10 bài viết có danh mục khác Video thuộc tính isHot = 1, trạng thái là active
        * sắp xếp giảm dần thuộc tính Views
        *  Đầu vào :danh mục bài viết, isHot = 1 , status = active
        * Đầu ra : Danh sách 10 bài viết
        * */
        List<Article> getTop10HotArticle = articleService.findTop10ByIsHotAndStatusOrderByViewsDesc((byte) 1, "active")
                .stream().filter(x -> x.getArticleCategories() != getArticleCategoryVideo).collect(Collectors.toList());
        return getTop10HotArticle;
    }

    @ModelAttribute("getTop10NewGame")
    public List<Games> getTop10NewGame() {

        /*
        * Lấy danh danh sách 10 game có  trạng thái là active
        *  Đầu vào : status = active
        * Đầu ra : Danh sách 10 game
        * */
        List<Games> getTop10NewGame = gamesService.findTop10ByStatusOrderByReleasesDesc("active");
        return getTop10NewGame;
    }

    @ModelAttribute("getTop10HotGame")
    public List<Games> getTop10HotGame() {
        /*
        * Lấy danh danh sách 10 game có  trạng thái là active, isHot = 1
        *  Đầu vào : status = active, isHot = 1
        * Đầu ra : Danh sách 10 game
        * */
        List<Games> getTop10HotGame = gamesService.findTop10ByIsHotAndStatusOrderByReleasesDesc((byte) 1, "active");
        return getTop10HotGame;
    }

    @ModelAttribute("getTop10GameOnline")
    public List<Games> getTop10GameOnline() {
          /*
        * Lấy danh mục game từ cơ sở dữ liệu có tên là Game Online
        * Đầu vào : Tên danh mục game
        * Đầu ra : Danh mục game
        * */
        GameCategory gameCategory = gameCategoryService.findByName("Game Online");
        /*
        * Lấy danh danh sách 10 game có danh mục game là  Game Online,  trạng thái là active, isHot = 1
        *  Đầu vào : danh mục game, status = active, isHot = 1
        * Đầu ra : Danh sách 10 game
        * */
        List<Games> getTop10GameOnline = gamesService.findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc
                (gameCategory, (byte) 1, "active");
        return getTop10GameOnline;
    }

    @ModelAttribute("getTop10GameOffline")
    public List<Games> getTop10GameOffline() {
          /*
        * Lấy danh mục game từ cơ sở dữ liệu có tên là Game Offline
        * Đầu vào : Tên danh mục game
        * Đầu ra : Danh mục game
        * */
        GameCategory gameCategory = gameCategoryService.findByName("Game Offline");
         /*
        * Lấy danh danh sách 10 game có danh mục game là  Game Offline,  trạng thái là active, isHot = 1
        *  Đầu vào : danh mục game, status = active, isHot = 1
        * Đầu ra : Danh sách 10 game
        * */
        List<Games> getTop10GameOffline = gamesService.findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc
                (gameCategory, (byte) 1, "active");
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
    public List<Article> getTop10ArticleCategoryNewReviewsList() {
        ArticleCategory getArticleCategoryReviews = articleCategoryService.findByName("Reviews");

        List<Article> getTop10ArticleCategoryNewReviewsList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategoryReviews, "active");
        return getTop10ArticleCategoryNewReviewsList;
    }

    @ModelAttribute("getTop10ArticleCategoryNewTienIchList")
    public List<Article> getTop10ArticleCategoryNewTienIchList() {
        ArticleCategory getArticleCategoryTienIch = articleCategoryService.findByName("Tiện Ích");

        List<Article> getTop10ArticleCategoryNewTienIchList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategoryTienIch, "active");
        return getTop10ArticleCategoryNewTienIchList;
    }

    @ModelAttribute("getTop10ArticleCategoryNewThuThuatList")
    public List<Article> getTop10ArticleCategoryNewThuThuatList() {
        ArticleCategory getArticleCategoryThuThuat = articleCategoryService.findByName("Thủ Thuật");

        List<Article> getTop10ArticleCategoryNewThuThuatList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategoryThuThuat, "active");
        return getTop10ArticleCategoryNewThuThuatList;
    }

    @ModelAttribute("getTop10ArticleHotAndNewGamingGearList")
    public List<Article> getTop10ArticleHotAndNewGamingGearList() {
        ArticleCategory getArticleCategoryGamingGear = articleCategoryService.findByName("Gaming Gear");

        List<Article> getTop10ArticleHotAndNewGamingGearList = articleService
                .findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
                        (getArticleCategoryGamingGear,(byte) 1, "active", new Date())
                .stream().limit(5).collect(Collectors.toList());
        return getTop10ArticleHotAndNewGamingGearList;
    }
    @ModelAttribute("getTop10ArticleHotAndNewMangaFilmList")
    public List<Article> getTop10ArticleHotAndNewMangaFilm() {
        ArticleCategory getArticleCategoryMangaFilm = articleCategoryService.findByName("Manga/Film");

        List<Article> getTop10ArticleHotAndNewMangaFilmList = articleService
                .findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
                        (getArticleCategoryMangaFilm,(byte) 1, "active", new Date())
                .stream().limit(5).collect(Collectors.toList());
        return getTop10ArticleHotAndNewMangaFilmList;
    }
    @ModelAttribute("getTop10ArticleHotAndNewReviewsList")
    public List<Article> getTop10ArticleHotAndNewReviewsList() {
        ArticleCategory getArticleCategoryReviews = articleCategoryService.findByName("Reviews");

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
        List<GameCategory> articleCategoryList = gameCategoryService.findAllByStatusOrderBySortOrderDesc("active");

        return articleCategoryList;

    }


    @RequestMapping("/{slug}.html")
    String chitiet(@PathVariable("slug") String slug, Model model,
                   @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "limit", defaultValue = "20") Integer limit
            , @RequestParam(value = "sorted", defaultValue = "news") String sorted, Authentication authentication
    ) {
        Article article = null;
        ArticleCategory articleCategory = null;
        Tags tags = null;
        Games games = null;
        model.addAttribute("sorted", "sorted=" + sorted);
        if (sorted.equals("news")) {
            sorted = "showDate";
        }
        if (sorted.equals("hots")) {
            sorted = "views";
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
                List<Article> articleLienQuanList = articleService
                        .findTop5ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc(getarticleCategory, (byte) 1, "active", new Date());

                articleLienQuanList.forEach(x -> System.out.println(x.getTitle() + "-----------------------------------"));
                List<Comment> getTop10Comment = commentService.findTop10ByStatusOrderByCreatedDateDesc("active");
                List<Article> getTop10ArticleList = articleService
                        .findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc("active", new Date());
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
                    games = gamesService.findByGameId(article.getGameId());
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
                if (articleCategory.getName().equals("Video")) {
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

                articleList = articleService.findAllByStatusAndShowDateBefore("active", new Date(), null);
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
                return "redirect:/403";
            }

        } catch (Exception e) {
            model.addAttribute("title", "Trang Thông Báo Lỗi 404");
            return "redirect:/403";
        }


    }

    @RequestMapping("/403.html")
    String error(Model model) {
        model.addAttribute("title", "Trang Thông Báo Lỗi 404");
        return "403";
    }


    @RequestMapping("/search.html")
    String search(Model model, @RequestParam("q") String q,
                  @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "limit", defaultValue = "20") Integer limit
            , @RequestParam(value = "sorted", defaultValue = "hots") String sorted) {
        String keywork = HtmlUtils.htmlEscape(q);
        System.out.println("KEY WORK : " + keywork);
        Map<String, String> objectCategoryAndTagMap = new HashMap<>();
        List<Article> articleList = null;
        ArticleCategory articleCategory = null;
        Tags tags = null;
        Comment comment = null;
        model.addAttribute("sorted", "sorted=" + sorted);
        if (sorted.equals("news")) {
            sorted = "showDate";
        }
        if (sorted.equals("hots")) {
            sorted = "views";
        }
        try {
            articleCategory = articleCategoryService.findTop1ByNameContainingOrSlugContainingAndStatus(keywork, keywork, "active");
            tags = tagsService.findTop1ByNameContainingOrSlugContaining(keywork, keywork);

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
    public String profile(Authentication authentication, Model model) {
        try {
            if (authentication != null) {


                model.addAttribute("title", "Trang Cá Nhân");
                return "canhan";
            } else {
                return "redirect:/403";
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "redirect:/403";
        }

    }

}
