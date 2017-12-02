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
    public void sessionUser(Authentication authentication, HttpSession session) {

        if (authentication != null) {
            System.out.println("VAO DAY");
            System.out.println(authentication.getAuthorities());
            session.setAttribute("user", usersService.findByUserName(authentication.getName()));

        }
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
    @RequestMapping("/games/hoso.html")
    String tranggame(Model model) {
        try {
            List<Games> Top5gamesList = gamesService.findTop5ByStatusAndIsHotOrderByViewsDesc("active",(byte) 1);
            List<Games> gamesList = gamesService.findAll();
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
