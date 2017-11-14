package com.javaweb.controller;


import com.javaweb.model.Article;
import com.javaweb.model.Comment;
import com.javaweb.model.Users;
import com.javaweb.service.ArticleService;
import com.javaweb.service.CommentService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;

@RestController
public class CommentRestController {
    @Autowired
    CommentService commentService;
    @Autowired
    UsersService usersService;
    @Autowired
    ArticleService articleService;
    @PostMapping("/comment")
    public String comment(@RequestParam("subCommentId") Integer subCommentId,@RequestParam("articleId") Integer articleId,
                          @RequestParam("content") String content, Authentication authentication ){

        try {
            Users users = usersService.findByUserName(authentication.getName());
            Article article = articleService.findByArticleId(articleId);
            Comment comment = new Comment();
            comment.setSubCommentId(subCommentId);
            comment.setContent(HtmlUtils.htmlEscape(content));
            comment.setUsersByUserId(users);
            comment.setUsersBySubUserId(users);
            comment.setArticle(article);
            comment.setStatus("active");
            comment.setCreatedDate(new Date());
            comment.setModifiedDate(new Date());

            commentService.saveorupdate(comment);
        }catch (Exception e){

        }

        return "";
    }
}
