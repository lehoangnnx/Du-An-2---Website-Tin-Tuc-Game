/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp ArticleLikeRestController thực thi xử lý thích bài viết bằng Ajax
* */
package com.javaweb.controller;

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
public class ArticleLikeRestController {
    @Autowired
    ArticleLikeService articleLikeService;
    @Autowired
    UsersService usersService;
    @Autowired
    ArticleService articleService;
    @PostMapping("/likearticles")
    // Thích bài viết
    public boolean showactive(@RequestParam("articleId") Integer articleId,
                                        Authentication authentication) {
        ArticleLike articleLike = null;


        try {

            Users users = usersService.findByUserName(authentication.getName());
            Article article = articleService.findByArticleId(articleId);
            articleLike = articleLikeService.findByUsersAndArticle(users,article);
                if (articleLike == null){
                    articleLike = new ArticleLike();
                    articleLike.setCreateDate(new Date());
                    articleLike.setArticle(article);
                    articleLike.setUsers(users);
                    articleLikeService.saveorupdate(articleLike);
                    return true;
                }
                else{
                   articleLikeService.delete(articleLike);
                    return false;
                }

        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }


    }
}
