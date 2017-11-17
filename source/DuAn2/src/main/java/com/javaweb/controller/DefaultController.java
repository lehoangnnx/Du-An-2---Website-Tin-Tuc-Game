package com.javaweb.controller;

import com.javaweb.model.*;
import com.javaweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;
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
    public void sessionUser(Authentication authentication, HttpSession session) {

        if (authentication != null) {
            System.out.println("VAO DAY");
            System.out.println(authentication.getAuthorities());
            session.setAttribute("user", usersService.findByUserName(authentication.getName()));

        }
    }

    @RequestMapping(value = {"/", "/home"})
    public String index(Principal p, Authentication authentication, HttpSession session, Model model

    ) {
        int pageSize = 10;

        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
        model.addAttribute("getArticleCategoryVideo", getArticleCategoryVideo);


        List<Article> getTop10ArticleCategoryNewAndHotVideoList = articleService
                .findTop10ByArticleCategoriesAndIsHotAndStatusAndShowDateBeforeOrderByViewsDesc
                        (getArticleCategoryVideo, (byte) 1, "active", new Date());
        model.addAttribute("getTop10ArticleCategoryNewAndHotVideoList", getTop10ArticleCategoryNewAndHotVideoList);


        ArticleCategory getArticleCategorySuKien = articleCategoryService.findByName("Sự Kiện");
        List<Article> getTop5ArticleCategoryNewSuKienList = articleService
                .findTop10ByArticleCategoriesAndStatusOrderByShowDateDesc(getArticleCategorySuKien, "active")
                .stream().limit(5).collect(Collectors.toList());
        model.addAttribute("getTop5ArticleCategoryNewSuKienList", getTop5ArticleCategoryNewSuKienList);

        List<Article> getTop10ArticleList = articleService
                .findTop10ByStatusAndShowDateBeforeOrderByShowDateDesc("active", new Date());

        model.addAttribute("getTop10ArticleList", getTop10ArticleList);

        GameCategory gameCategoryPcConsole = gameCategoryService.findByName("Game Pc-Console");
        List<Games> getTop3GamePcConsole = gamesService
                .findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategoryPcConsole, (byte) 1, "active")
                .stream().limit(3).collect(Collectors.toList());
        model.addAttribute("getTop3GamePcConsole", getTop3GamePcConsole);

        GameCategory gameCategoryEsport = gameCategoryService.findByName("Game Esport");
        List<Games> getTop3GameEsport = gamesService
                .findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategoryEsport, (byte) 1, "active")
                .stream().limit(3).collect(Collectors.toList());
        model.addAttribute("getTop3GameEsport", getTop3GameEsport);

        GameCategory gameCategoryMobile = gameCategoryService.findByName("Game Mobile");
        List<Games> getTop3GameMobile = gamesService
                .findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategoryMobile, (byte) 1, "active")
                .stream().limit(3).collect(Collectors.toList());
        model.addAttribute("getTop3GameMobile", getTop3GameMobile);

        model.addAttribute("title", "Website Game24h");
        return "home";
    }

    @ModelAttribute("getTop5ArticleCategoryHotVideoList")
    public List<Article> getTop5ArticleCategoryHotVideoList() {
        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
        List<Article> getTop5ArticleCategoryHotVideoList = articleService
                .findTop5ByArticleCategoriesAndStatusAndShowDateBeforeOrderByViewsDesc(getArticleCategoryVideo,  "active", new Date());
        getTop5ArticleCategoryHotVideoList.forEach(x -> System.out.println(x.getSlug()));
        return getTop5ArticleCategoryHotVideoList;
    }

    @ModelAttribute("getTop10HotArticle")
    public List<Article> getTop10HotArticle() {
        ArticleCategory getArticleCategoryVideo = articleCategoryService.findByName("Video");
        List<Article> getTop10HotArticle = articleService.findTop10ByIsHotAndStatusOrderByViewsDesc((byte) 1, "active")
                .stream().filter(x -> x.getArticleCategories() != getArticleCategoryVideo).collect(Collectors.toList());
        getTop10HotArticle.forEach(x -> System.out.println(x.getTitle()));
        return getTop10HotArticle;
    }

    @ModelAttribute("getTop10NewGame")
    public List<Games> getTop10NewGame() {
        List<Games> getTop10NewGame = gamesService.findTop10ByStatusOrderByReleasesDesc("active");
        return getTop10NewGame;
    }

    @ModelAttribute("getTop10HotGame")
    public List<Games> getTop10HotGame() {
        List<Games> getTop10HotGame = gamesService.findTop10ByIsHotAndStatusOrderByReleasesDesc((byte) 1, "active");
        return getTop10HotGame;
    }

    @ModelAttribute("getTop10GameOnline")
    public List<Games> getTop10GameOnline() {
        GameCategory gameCategory = gameCategoryService.findByName("Game Online");
        List<Games> getTop10GameOnline = gamesService.findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategory, (byte) 1, "active");
        return getTop10GameOnline;
    }

    @ModelAttribute("getTop10GameOffline")
    public List<Games> getTop10GameOffline() {
        GameCategory gameCategory = gameCategoryService.findByName("Game Offline");
        List<Games> getTop10GameOffline = gamesService.findTop10ByGameCategoriesAndIsHotAndStatusOrderByReleasesDesc(gameCategory, (byte) 1, "active");
        return getTop10GameOffline;
    }

    @ModelAttribute("getTop5ArticleHotAndViews")
    public List<Article> getTop5ArticleHotAndViews() {

        List<Article> getTop5ArticleHotAndViews = articleService.findTop5ByIsHotAndStatusOrderByViewsDesc((byte) 1, "active");
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

    @ModelAttribute("getTop20TagsList")
    public List<Tags> getTop20TagsList() {
        List<Tags> getTop20TagsList = tagsService.findAll().stream().limit(20).collect(Collectors.toList());
        return getTop20TagsList;
    }

    @ModelAttribute("articleCategoryList")
    public List<ArticleCategory> getCategory() {
        List<ArticleCategory> articleCategoryList = articleCategoryService.findAll()
                .stream().filter(x -> x.getStatus().equals("active")).collect(Collectors.toList());

        return articleCategoryList;

    }


    @RequestMapping("/{slug}")
    String chitiet(@PathVariable("slug") String slug, Model model,
                   @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "limit", defaultValue = "2") Integer limit
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

                List<ArticleLike> articleLikeList =  articleLikeService.findAllByArticle(article);
                boolean userOfArticleLike = false;
                for (ArticleLike al : articleLikeList){
                    if (authentication != null) {
                        if (al.getUsers() == usersService.findByUserName(authentication.getName())){
                            userOfArticleLike = true;
                            break;
                        }
                    }


                }
                model.addAttribute("articleLikeList", articleLikeList);
                model.addAttribute("userOfArticleLike", userOfArticleLike);
                return "chitiet";
            } else if (articleCategory != null) {
                if(articleCategory.getName().equals("Video")){
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
            System.out.println(e.getMessage() + "LOIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
            model.addAttribute("title", "Trang Thông Báo Lỗi 404");
            return "redirect:/403";
        }


    }

    @RequestMapping("/403")
    String error(Model model) {
        model.addAttribute("title", "Trang Thông Báo Lỗi 404");
        return "403";
    }


}
