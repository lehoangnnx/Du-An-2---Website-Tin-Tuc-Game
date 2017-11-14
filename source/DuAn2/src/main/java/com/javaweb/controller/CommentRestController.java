package com.javaweb.controller;


import com.javaweb.model.Article;
import com.javaweb.model.Comment;
import com.javaweb.model.Users;
import com.javaweb.repository.CommentRepository;
import com.javaweb.service.ArticleService;
import com.javaweb.service.CommentService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

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
                          @RequestParam("usersBySubUserId") Integer usersBySubUserId ,
                          @RequestParam("content") String content, Authentication authentication ){

        try {

            Users users = usersService.findByUserName(authentication.getName());
            Users subUsers = usersService.findByUserId(usersBySubUserId);
            Article article = articleService.findByArticleId(articleId);
            Comment comment = new Comment();
            comment.setSubCommentId(subCommentId);
            comment.setContent(HtmlUtils.htmlEscape(content));
            comment.setUsersByUserId(users);
            if(usersBySubUserId == 0){
                comment.setUsersBySubUserId(users);
            }else{
                comment.setUsersBySubUserId(subUsers);
            }


            comment.setArticle(article);
            comment.setStatus("active");
            comment.setCreatedDate(new Date());
            comment.setModifiedDate(new Date());

            commentService.saveorupdate(comment);
        }catch (Exception e){

        }

        return "";
    }

    @GetMapping("/getcomment")
    public Map<String, Object> getcomment(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                          Authentication authentication){

        int userIdLogin = 0;
        if (authentication != null) {
           userIdLogin = usersService.findByUserName(authentication.getName()).getUserId();
        }
        List<Comment> commentParentPage = commentService.findAllByStatusAndSubCommentId("active", 0,
                new PageRequest(page, 10,new Sort( Sort.Direction.DESC,"createdDate")));
        List<Comment> commentChild = commentService.findAllByStatusAndSubCommentIdGreaterThanOrderByModifiedDateDesc("active", 0);
        List<Map<String, Object>> commentParentListMap = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> commentChildListMap = new ArrayList<Map<String, Object>>();
        Map<String, Object> commentAllMap = new HashMap<String, Object>();
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        commentParentPage.forEach( x -> {
            Map<String, Object> commentMap = new HashMap<String, Object>();
            commentMap.put("commentId", x.getCommentId());
            commentMap.put("subCommentId",x.getSubCommentId());
            commentMap.put("articleId",x.getArticle().getArticleId());
            commentMap.put("usersByUserId",x.getUsersByUserId().getUserId());
            commentMap.put("usersByUserUserName",x.getUsersByUserId().getUserName());
            commentMap.put("usersBySubUserId", x.getUsersBySubUserId().getUserId());
            commentMap.put("usersBySubUserUserName",x.getUsersBySubUserId().getUserName());
            commentMap.put("usersByUserAvatar",x.getUsersByUserId().getAvatar());
            commentMap.put("content",x.getContent());
            commentMap.put("modifiedDate",df.format(x.getModifiedDate()));
            commentParentListMap.add(commentMap);
        });

        commentChild.forEach(x ->{
            Map<String, Object> commentMap = new HashMap<String, Object>();
            commentMap.put("commentId", x.getCommentId());
            commentMap.put("subCommentId",x.getSubCommentId());
            commentMap.put("articleId",x.getArticle().getArticleId());
            commentMap.put("usersByUserId",x.getUsersByUserId().getUserId());
            commentMap.put("usersByUserUserName",x.getUsersByUserId().getUserName());
            commentMap.put("usersBySubUserId", x.getUsersBySubUserId().getUserId());
            commentMap.put("usersBySubUserUserName",x.getUsersBySubUserId().getUserName());
            commentMap.put("usersByUserAvatar",x.getUsersByUserId().getAvatar());
            commentMap.put("content",x.getContent());
            commentMap.put("modifiedDate",df.format(x.getModifiedDate()));
            commentChildListMap.add(commentMap);

        });
        commentAllMap.put("commentparent",commentParentListMap);
        commentAllMap.put("commentchild",commentChildListMap);
        commentAllMap.put("userIdLogin",userIdLogin);
        return commentAllMap;
    }
}
