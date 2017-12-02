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
    public List<Map<String, Object>> getGame(@RequestParam(value = "gameCategorySlug",defaultValue = "all") String gameCategorySlug,
                                             @RequestParam(value = "publishers",defaultValue = "all") String publishers,
                                             @RequestParam(value = "keysearch",defaultValue = "") String keysearch,
                                             @RequestParam(value = "page", defaultValue = "1") String stpage,
                                             @RequestParam(value = "sorted", defaultValue = "news") String sorted ) {
        int page = 1;
        try {
            page = Integer.parseInt(stpage);
        }catch (NumberFormatException e){
            page = 1;
        }
        if (sorted.equals("news")) {
            sorted = "releases";
        }
        else if (sorted.equals("hots")) {
            sorted = "views";
        }else {
            sorted = "releases";
        }
        List<Map<String, Object>> gamesListMap = new ArrayList<Map<String, Object>>();


        String gameKeySearch = HtmlUtils.htmlEscape(keysearch);
        String gamePublishers = HtmlUtils.htmlEscape(publishers);

        try {
            List<Games> gamesList = null;
            GameCategory gameCategory = null;
            if (!gameCategorySlug.equals("all") && publishers.equals("all") && keysearch.equals("")) {

                gameCategory = gameCategoryService.findBySlug(gameCategorySlug);
                gamesList = gamesService.findDistinctByGameCategoriesAndStatus(gameCategory, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, sorted)));
            } else if (!gameCategorySlug.equals("all") && !publishers.equals("all") && keysearch.equals("")) {
                gameCategory = gameCategoryService.findBySlug(gameCategorySlug);
                gamesList = gamesService.findDistinctByGameCategoriesAndPublishersAndStatus
                (gameCategory, gamePublishers, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, sorted)));
            } else if (!gameCategorySlug.equals("all") && publishers.equals("all") && !keysearch.equals("")) {
                gameCategory = gameCategoryService.findBySlug(gameCategorySlug);
                gamesList = gamesService.findDistinctByGameCategoriesAndNameContainingOrSlugContainingAndStatus
                (gameCategory, gameKeySearch,gameKeySearch, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, sorted)));
            } else if (gameCategorySlug.equals("all") && !publishers.equals("all") && keysearch.equals("")) {
                gamesList = gamesService.findDistinctByPublishersAndStatus(gamePublishers, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, sorted)));
            } else if (gameCategorySlug.equals("all") && !publishers.equals("all") && !keysearch.equals("")) {
                gamesList = gamesService.findDistinctByPublishersAndNameContainingOrSlugContainingAndStatus
                (gamePublishers, gameKeySearch,gameKeySearch ,"active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, sorted)));

            } else if (gameCategorySlug.equals("all") && publishers.equals("all") && !keysearch.equals("")) {
                gamesList = gamesService.findDistinctByNameContainingOrSlugContainingAndStatus
                (gameKeySearch,gameKeySearch, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, sorted)));

            } else if (!gameCategorySlug.equals("all") && !publishers.equals("all") && !keysearch.equals("")) {
                gameCategory = gameCategoryService.findBySlug(gameCategorySlug);
                gamesList = gamesService.findDistinctByGameCategoriesAndPublishersAndNameContainingOrSlugContainingAndStatus
                (gameCategory, gamePublishers, gameKeySearch,gameKeySearch, "active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, sorted)));

            } else if (gameCategorySlug.equals("all") && publishers.equals("all") && keysearch.equals("")) {
                gamesList = gamesService.findAllByStatus("active",
                        new PageRequest(page - 1, 9, new Sort(Sort.Direction.DESC, sorted)));
            }

            gamesList.forEach(x -> {

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
    @GetMapping("/getgamesname")
    public Map<String, Object> getnamegame(){
        Map<String, Object> gamesNameMap = new HashMap<String, Object>();
        List<String> nameGame = gamesService.findName("active");
        gamesNameMap.put("gamesName", nameGame);
        return gamesNameMap;
    }
}



