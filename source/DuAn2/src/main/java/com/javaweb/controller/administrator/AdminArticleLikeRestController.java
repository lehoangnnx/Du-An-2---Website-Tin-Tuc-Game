package com.javaweb.controller.administrator;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleLike;
import com.javaweb.model.Users;
import com.javaweb.service.ArticleLikeService;
import com.javaweb.service.ArticleService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class AdminArticleLikeRestController {
    @Autowired
    ArticleLikeService articleLikeService;
    @Autowired
    UsersService usersService;
    @Autowired
    ArticleService articleService;
    @PostMapping("/likearticles")
    public List<ArticleLike> showactive(@RequestParam("articleId") Integer articleId, @RequestParam("status") boolean status,
                                        Authentication authentication) {
        ArticleLike articleLike = null;
        System.out.println("ASDADSDSADSD " + articleId + status);
        List<ArticleLike> articleLikeList = null;
        Map<String,Object> articleLikeMap = new HashMap<>();

        try {

            Users users = usersService.findByUserName(authentication.getName());
            Article article = articleService.findByArticleId(articleId);
            articleLike = articleLikeService.findByUsersAndArticle(users,article);

            if (status){

                if (articleLike == null){
                    articleLike = new ArticleLike();
                    articleLike.setCreateDate(new Date());
                    articleLike.setArticle(article);
                    articleLike.setUsers(users);
                    articleLikeService.saveorupdate(articleLike);
                }
            }else {
                if (articleLike != null){
                   articleLikeService.delete(articleLike);
                }
            }


        }catch (Exception e){}

        return null;
    }
}
