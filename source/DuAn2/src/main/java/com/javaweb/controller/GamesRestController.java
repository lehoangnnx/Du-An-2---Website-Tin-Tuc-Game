package com.javaweb.controller;


import com.javaweb.model.GameCategory;
import com.javaweb.model.GameReviews;
import com.javaweb.model.Games;
import com.javaweb.service.GameCategoryService;
import com.javaweb.service.GameReviewsService;
import com.javaweb.service.GamesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class GamesRestController {
    @Autowired
    GamesService gamesService;
    @Autowired
    GameCategoryService gameCategoryService;
    @Autowired
    GameReviewsService gameReviewsService;

    @GetMapping("/getgames")
    public List<Map<String, Object>> getGame(@RequestParam("gameCategoryId") Integer gameCategoryId,
                                             @RequestParam("publishers") String publishers, @RequestParam("keysearch") String keysearch,
                                             @RequestParam(value = "page", defaultValue = "1") Integer page) {
        List<Map<String, Object>> gamesListMap = new ArrayList<Map<String, Object>>();

        System.out.println(gameCategoryId + publishers + keysearch + "NNNNNNNNNNNNNNNN");
        String gameName = HtmlUtils.htmlEscape(keysearch);
        String gamePublishers = HtmlUtils.htmlEscape(publishers);
        try {
            List<Games> gamesList = null;
            GameCategory gameCategory = null;
            if (!gameCategoryId.equals(0) && publishers.equals("all") && keysearch.equals("")) {
                gameCategory = gameCategoryService.findByGameCategoryId(gameCategoryId);
                gamesList = gamesService.findDistinctByGameCategoriesAndStatus(gameCategory, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, "views")));
            } else if (!gameCategoryId.equals(0) && !publishers.equals("all") && keysearch.equals("")) {
                gameCategory = gameCategoryService.findByGameCategoryId(gameCategoryId);
                gamesList = gamesService.findDistinctByGameCategoriesAndPublishersAndStatus(gameCategory, gamePublishers, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, "views")));
            } else if (!gameCategoryId.equals(0) && publishers.equals("all") && !keysearch.equals("")) {
                gameCategory = gameCategoryService.findByGameCategoryId(gameCategoryId);
                gamesList = gamesService.findDistinctByGameCategoriesAndNameContainingAndStatus(gameCategory, gameName, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, "views")));
            } else if (gameCategoryId.equals(0) && !publishers.equals("all") && keysearch.equals("")) {
                gamesList = gamesService.findDistinctByPublishersAndStatus(gamePublishers, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, "views")));
            } else if (gameCategoryId.equals(0) && !publishers.equals("all") && !keysearch.equals("")) {
                gamesList = gamesService.findDistinctByPublishersAndNameContainingAndStatus(gamePublishers, gameName, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, "views")));
            } else if (gameCategoryId.equals(0) && publishers.equals("all") && !keysearch.equals("")) {
                gamesList = gamesService.findDistinctByNameContainingAndStatus(gameName, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, "views")));
            } else if (!gameCategoryId.equals(0) && !publishers.equals("all") && !keysearch.equals("")) {
                gameCategory = gameCategoryService.findByGameCategoryId(gameCategoryId);
                gamesList = gamesService.findDistinctByGameCategoriesAndPublishersAndNameContainingAndStatus(gameCategory, gamePublishers, gameName, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, "views")));
            } else if (gameCategoryId.equals(0) && publishers.equals("all") && keysearch.equals("")) {
                gamesList = gamesService.findAllByStatus("active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, "views")));
            }

            gamesList.forEach(x -> {
                System.out.println(x.getGameId());
                Map<String, Object> gamesMap = new HashMap<String, Object>();
                gamesMap.put("name", x.getName());
                gamesMap.put("slug", x.getSlug());
                gamesMap.put("images", x.getImages());
                gamesMap.put("homeUrl", x.getHomeUrl());
                gamesMap.put("downloadUrl", x.getDownloadUrl());
                int pointGameReviews = 0;
                if (!gameReviewsService.findAllByGames(x).isEmpty()) {
                    List<GameReviews> gameReviewsList = gameReviewsService.findAllByGames(x);
                    for (GameReviews g : gameReviewsList) {
                        pointGameReviews = pointGameReviews + (int) g.getReview();

                    }
                    gamesMap.put("gameReviews", gameReviewsList.size());
                    gamesMap.put("pointGameReviews", pointGameReviews / gameReviewsList.size());

                } else {
                    gamesMap.put("gameReviews", 0);
                    gamesMap.put("pointGameReviews", 0);

                }
                List<Map<String, Object>> gamesCategoryListMap = new ArrayList<Map<String, Object>>();
                x.getGameCategories().forEach(y -> {
                    Map<String, Object> articleCategoryMap = new HashMap<String, Object>();
                    articleCategoryMap.put("name", y.getName());
                    articleCategoryMap.put("slug", y.getSlug());
                    gamesCategoryListMap.add(articleCategoryMap);

                });
                gamesMap.put("gamesCategories", gamesCategoryListMap);
                gamesListMap.add(gamesMap);
            });
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return gamesListMap;
    }
}
