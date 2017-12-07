/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* */
package com.javaweb.controller;

import com.javaweb.model.*;
import com.javaweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class GamesController {

    @Autowired
    GamesService gamesService;
    @Autowired
    GameCategoryService gameCategoryService;
    @Autowired
    ArticleService articleService;
    @Autowired
    GameReviewsService gameReviewsService;
    @Autowired
    UsersService usersService;
    @Autowired
    ArticleCategoryService articleCategoryService;

    @ModelAttribute("user")
    // Lưu session người dùng
    public void sessionUser(Authentication authentication, HttpSession session) {

        if (authentication != null) {
            System.out.println(authentication.getAuthorities());
            session.setAttribute("user", usersService.findByUserName(authentication.getName()));

        }
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
    @ModelAttribute("articleCategoryList")
    public List<ArticleCategory> getCategory() {
        // Lấy danh sách danh mục bài viết theo status
        List<ArticleCategory> articleCategoryList = articleCategoryService.findAllByStatusOrderBySortOrderAsc("active");

        return articleCategoryList;

    }
    @ModelAttribute("gamesCategoryList")
    public List<GameCategory> gamesCategoryList() {
        // Lấy danh sách danh mục game
        List<GameCategory> gameCategoryList = gameCategoryService.findAllByStatusOrderBySortOrderDesc("active");

        return gameCategoryList;

    }
    @RequestMapping("/games/hoso.html")
    // Hiển thị trang game
    String tranggame(Model model) {
        try {

            // Lấy danh sách game theo status và isHot
            List<Games> Top5gamesList = gamesService.findTop5ByStatusAndIsHotOrderByViewsDesc("active",(byte) 1);
            // Lấy tất cả danh sách game
            List<Games> gamesList = gamesService.findAll();

            // Lấy danh sách danh mục game
            List<GameCategory> gameCategoryList = gameCategoryService.findAll().stream()
                    .filter(x -> x.getStatus().equals("active")).collect(Collectors.toList());
            model.addAttribute("Top5gamesList",Top5gamesList);
            model.addAttribute("gamesList",gamesList);
            model.addAttribute("gameCategoryList",gameCategoryList);
            List<Article> articleList = articleService.findTop10ByIsHotAndStatusOrderByViewsDesc((byte) 1, "active")
                    .stream().filter(x -> !x.getGameId().equals(0)).collect(Collectors.toList());

            model.addAttribute("articleList",articleList);
            model.addAttribute("title", "Hồ Sơ Game - Cổng Thông Tin Game - Game Mới Cập Nhập");
            return "game";
        }catch (Exception e){
            System.out.println(e.getMessage());
            return "redirect:/403.html";
        }

    }
    @RequestMapping("/games/{slug}")
    // Hiển thị trang chi tiết game
    public String chitietgame(Model model, @PathVariable("slug") String slug, Authentication authentication) {

        try {
            Games games = gamesService.findBySlug(slug);

            int pointGameReviews = 0;
            int pointGameReviewsOfUser = 0;
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
                model.addAttribute("gameReviews", gameReviewsList.size());
            }else {
                model.addAttribute("pointGameReviews", 0);
                model.addAttribute("pointGameReviewsOfUser", 0);
                model.addAttribute("gameReviews", 0);
            }
            List<Article> articleList = articleService.findTop10ByIsHotAndStatusOrderByViewsDesc((byte) 1, "active")
                    .stream().filter(x -> !x.getGameId().equals(0)).collect(Collectors.toList());

            model.addAttribute("articleList",articleList);
            games.setSystemRequirements(HtmlUtils.htmlUnescape(games.getSystemRequirements()));
            model.addAttribute("games", games);
            model.addAttribute("title", games.getName());
            return "chitietgame";
        }catch (Exception e){
            System.out.println(e.getMessage());
            return "redirect:/403.html";
        }

    }
}
