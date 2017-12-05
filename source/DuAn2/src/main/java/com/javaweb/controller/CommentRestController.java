/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 15/11/2017
*  Lớp CommentRestController thực thi xử lý bình luận bằng Ajax
* */
package com.javaweb.controller;


import com.javaweb.model.Article;
import com.javaweb.model.Comment;
import com.javaweb.model.CommentLike;
import com.javaweb.model.Users;
import com.javaweb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    RolesService rolesService;
    @Autowired
    CommentLikeService commentLikeService;

    @PostMapping("/newcomment")
    // Tạo mới bình luận và lưu vào cơ sở dữ liệu
    public Map<String, Object> comment(@RequestParam("articleId") Integer articleId,
                                       @RequestParam("content") String content, Authentication authentication,
                                       HttpServletRequest request) {
        DateFormat df = new SimpleDateFormat("HH:mm dd-MM-yyyy");
        Map<String, Object> commentMap = new HashMap<String, Object>();
        try {

            Users users = usersService.findByUserName(authentication.getName());
            Article article = articleService.findByArticleId(articleId);
            Comment comment = new Comment();
            comment.setSubCommentId(0);
            comment.setContent(HtmlUtils.htmlEscape(content.trim()));
            comment.setUsersByUserId(users);
            comment.setUsersBySubUserId(users);
            comment.setArticle(article);
            comment.setStatus("active");
            comment.setCreatedDate(new Date());
            comment.setModifiedDate(new Date());
            commentService.saveorupdate(comment);

            Comment newcomment=commentService.findTop1ByArticleAndUsersByUserIdAndSubCommentIdOrderByCreatedDateDesc
                    (article,users,0);


            commentMap.put("commentId", newcomment.getCommentId());
            commentMap.put("subCommentId", newcomment.getSubCommentId());
            commentMap.put("articleId", newcomment.getArticle().getArticleId());
            commentMap.put("usersByUserId", newcomment.getUsersByUserId().getUserId());
            commentMap.put("usersBySubUserId", newcomment.getUsersBySubUserId().getUserId());
            if (newcomment.getUsersByUserId().getRoleses().contains(rolesService.findByName("ROLE_FACEBOOK"))
                    || newcomment.getUsersByUserId().getRoleses().contains(rolesService.findByName("ROLE_GOOGLE"))) {

                commentMap.put("usersByUserUserName", newcomment.getUsersByUserId().getFirstName()+" "
                        + newcomment.getUsersByUserId().getLastName());
                commentMap.put("usersByUserAvatar", newcomment.getUsersByUserId().getAvatar());
            } else {
                commentMap.put("usersByUserUserName", newcomment.getUsersByUserId().getUserName());
                commentMap.put("usersByUserAvatar", request.getContextPath() + "/images/avatar/" + newcomment.getUsersByUserId().getAvatar());
            }
            if (newcomment.getUsersBySubUserId().getRoleses().contains(rolesService.findByName("ROLE_FACEBOOK"))
                    || newcomment.getUsersBySubUserId().getRoleses().contains(rolesService.findByName("ROLE_GOOGLE"))) {
                commentMap.put("usersBySubUserUserName", newcomment.getUsersBySubUserId().getFirstName()+" "+newcomment.getUsersBySubUserId().getLastName());

            } else {
                commentMap.put("usersBySubUserUserName", newcomment.getUsersBySubUserId().getUserName());
            }
            if (authentication != null){
                if(commentLikeService.findByCommentAndUsers(newcomment,usersService.findByUserName(authentication.getName())) == null){
                    commentMap.put("statusofusercommentlike", false);
                }
                else {
                    commentMap.put("statusofusercommentlike", true);
                }
            }


            commentMap.put("countcommentlike", commentLikeService.countByComment(newcomment));
            commentMap.put("usersBySubUserUserName", newcomment.getUsersBySubUserId().getUserName());
            commentMap.put("content", newcomment.getContent());
            commentMap.put("modifiedDate", df.format(newcomment.getModifiedDate()));

            int userIdLogin = 0;
            boolean roleEditComment = false;
            String avatar = "";
            String userName = "";


                userIdLogin = users.getUserId();
                if (request.isUserInRole("ROLE_FACEBOOK")
                        || request.isUserInRole("ROLE_GOOGLE")) {
                    userName = users.getFirstName() + " " + users.getLastName();
                    avatar = users.getAvatar();
                } else {
                    userName = users.getUserName();
                    avatar = request.getContextPath() + "/images/avatar/" + users.getAvatar();
                }
                if (request.isUserInRole("ROLE_ADMIN")
                        || article.getUsers().getUserId() == usersService.findByUserName(authentication.getName()).getUserId()) {
                    roleEditComment = true;
                }

            commentMap.put("userIdLogin", userIdLogin);
            commentMap.put("avatar", avatar);
            commentMap.put("userName", userName);
            commentMap.put("roleEditComment", roleEditComment);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return commentMap;
    }

    @PostMapping("/replycomment")
    // Tạo mới bình luận, bình luận được tạo mới là bình luận con của bình luận có sẵn
    public Map<String, Object> replycomment(@RequestParam("subCommentId") Integer subCommentId,
                                            @RequestParam("articleId") Integer articleId,
                                            @RequestParam("usersBySubUserId") Integer usersBySubUserId,
                                            @RequestParam("content") String content, Authentication authentication,
                                            HttpServletRequest request) {

        try {

            Users users = usersService.findByUserName(authentication.getName());
            Users subUsers = usersService.findByUserId(usersBySubUserId);
            Article article = articleService.findByArticleId(articleId);
            Comment comment = new Comment();
            comment.setSubCommentId(subCommentId);
            comment.setContent(HtmlUtils.htmlEscape(content.trim()));
            comment.setUsersByUserId(users);
            comment.setUsersBySubUserId(subUsers);
            comment.setArticle(article);
            comment.setStatus("active");
            comment.setCreatedDate(new Date());
            comment.setModifiedDate(new Date());
            commentService.saveorupdate(comment);
        } catch (Exception e) {

        }

        return getAllcommentPaging("0", articleId, authentication, request);
    }

    @GetMapping("/getcomment")
    // Lấy tất cả bình luận trong cơ sở dữ liệu
    public Map<String, Object> getcomment(@RequestParam(value = "page", defaultValue = "0") String stpage,
                                          @RequestParam("articleId") Integer articleId,
                                          Authentication authentication, HttpServletRequest request) {

        return getAllcommentPaging(stpage, articleId, authentication, request);
    }
    @PostMapping("/commentlike")
    public Map<String,Object> commentLike(Authentication authentication,@RequestParam("commentId") Integer commentId){
        CommentLike  commentLike = null;
        try {
            Comment comment = commentService.findByCommentId(commentId);
            Users users = usersService.findByUserName(authentication.getName());
            commentLike = commentLikeService.findByCommentAndUsers(comment,users);
            Map<String ,Object> commentLikeMap =  new HashMap<>();
            if(commentLike == null){
                commentLike = new CommentLike();
                commentLike.setComment(comment);
                commentLike.setUsers(users);
                commentLike.setCreateDate(new Date());
                commentLikeService.saveorupdate(commentLike);
                commentLikeMap.put("status",true);
            }else {
                commentLikeService.delete(commentLike);
                commentLikeMap.put("status",false);
            }
            commentLikeMap.put("countcommentlike",commentLikeService.countByComment(comment));
            return commentLikeMap;
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return null;
    }
    @PostMapping("/deletecomment")
    // Xóa bình luận - Chuyển trạng thái bình luận sang deleted
    public String deletecomment(@RequestParam("commentId") Integer commentId) {
        try {
            List<Comment> commentList = commentService.findAllByCommentIdOrSubCommentId(commentId, commentId);
            commentList.forEach(x -> {
                x.setStatus("deleted");
                commentService.saveorupdate(x);
            });
            return "success";
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "error";
        }


    }

    @PostMapping("/updatecomment")
    // Sửa bình luận
    public String updatecomment(@RequestParam("commentId") Integer commentId, @RequestParam("content") String content) {
        try {
            Comment comment = commentService.findByCommentId(commentId);
            comment.setContent(HtmlUtils.htmlEscape(content.trim()));
            commentService.saveorupdate(comment);
            return "success";
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "error";
        }


    }

    // Lấy tất cả bình luận trong cơ sở dữ liệu và phân trang
    public Map<String, Object> getAllcommentPaging(String stpage, Integer articleId,
                                                   Authentication authentication, HttpServletRequest request) {


        int page = 0;

        try {
            page = Integer.parseInt(stpage);
        }catch (NumberFormatException e){
            page = 0;
        }
        Article article = articleService.findByArticleId(articleId);
        List<Comment> commentParentPage = commentService.findAllByArticleAndStatusAndSubCommentId(article, "active", 0,
                new PageRequest(page, 10, new Sort(Sort.Direction.DESC, "createdDate")));
        List<Comment> commentChild = commentService.findAllByArticleAndStatusAndSubCommentIdGreaterThanOrderByModifiedDateDesc(article, "active", 0);
        List<Map<String, Object>> commentParentListMap = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> commentChildListMap = new ArrayList<Map<String, Object>>();
        Map<String, Object> commentAllMap = new HashMap<String, Object>();
        DateFormat df = new SimpleDateFormat("HH:mm dd-MM-yyyy");

        commentParentPage.forEach(x -> {
            Map<String, Object> commentMap = new HashMap<String, Object>();
            commentMap.put("commentId", x.getCommentId());
            commentMap.put("subCommentId", x.getSubCommentId());
            commentMap.put("articleId", x.getArticle().getArticleId());
            commentMap.put("usersByUserId", x.getUsersByUserId().getUserId());
            commentMap.put("usersBySubUserId", x.getUsersBySubUserId().getUserId());
            if (x.getUsersByUserId().getRoleses().contains(rolesService.findByName("ROLE_FACEBOOK"))
                    || x.getUsersByUserId().getRoleses().contains(rolesService.findByName("ROLE_GOOGLE"))) {

                commentMap.put("usersByUserUserName", x.getUsersByUserId().getFirstName()+" "+ x.getUsersByUserId().getLastName());
                commentMap.put("usersByUserAvatar", x.getUsersByUserId().getAvatar());
            } else {
                commentMap.put("usersByUserUserName", x.getUsersByUserId().getUserName());
                commentMap.put("usersByUserAvatar", request.getContextPath() + "/images/avatar/" + x.getUsersByUserId().getAvatar());
            }
            if (x.getUsersBySubUserId().getRoleses().contains(rolesService.findByName("ROLE_FACEBOOK"))
                    || x.getUsersBySubUserId().getRoleses().contains(rolesService.findByName("ROLE_GOOGLE"))) {
                commentMap.put("usersBySubUserUserName", x.getUsersBySubUserId().getFirstName()+" "+x.getUsersBySubUserId().getLastName());

            } else {
                commentMap.put("usersBySubUserUserName", x.getUsersBySubUserId().getUserName());
            }
            if (authentication != null){
                if(commentLikeService.findByCommentAndUsers(x,usersService.findByUserName(authentication.getName())) == null){
                    commentMap.put("statusofusercommentlike", false);
                }
                else {
                    commentMap.put("statusofusercommentlike", true);
                }
            }


            commentMap.put("countcommentlike", commentLikeService.countByComment(x));
            commentMap.put("usersBySubUserUserName", x.getUsersBySubUserId().getUserName());
            commentMap.put("content", x.getContent());
            commentMap.put("modifiedDate", df.format(x.getModifiedDate()));
            commentParentListMap.add(commentMap);
        });

        commentChild.forEach(x -> {
            Map<String, Object> commentMap = new HashMap<String, Object>();
            commentMap.put("commentId", x.getCommentId());
            commentMap.put("subCommentId", x.getSubCommentId());
            commentMap.put("articleId", x.getArticle().getArticleId());
            commentMap.put("usersByUserId", x.getUsersByUserId().getUserId());
            commentMap.put("usersBySubUserId", x.getUsersBySubUserId().getUserId());
            if (x.getUsersByUserId().getRoleses().contains(rolesService.findByName("ROLE_FACEBOOK"))
                    || x.getUsersByUserId().getRoleses().contains(rolesService.findByName("ROLE_GOOGLE"))) {
                commentMap.put("usersByUserUserName", x.getUsersByUserId().getFirstName()+" "+x.getUsersByUserId().getLastName());
                commentMap.put("usersByUserAvatar", x.getUsersByUserId().getAvatar());
            } else {
                commentMap.put("usersByUserUserName", x.getUsersByUserId().getUserName());
                commentMap.put("usersByUserAvatar", request.getContextPath() + "/images/avatar/" + x.getUsersByUserId().getAvatar());
            }
            if (x.getUsersBySubUserId().getRoleses().contains(rolesService.findByName("ROLE_FACEBOOK"))
                    || x.getUsersBySubUserId().getRoleses().contains(rolesService.findByName("ROLE_GOOGLE"))) {

                commentMap.put("usersBySubUserUserName", x.getUsersBySubUserId().getFirstName()+" "+x.getUsersBySubUserId().getLastName());
            } else {

                commentMap.put("usersBySubUserUserName", x.getUsersBySubUserId().getUserName());
            }
            if (authentication != null){
                if(commentLikeService.findByCommentAndUsers(x,usersService.findByUserName(authentication.getName())) == null){
                    commentMap.put("statusofusercommentlike", false);
                }
                else {
                    commentMap.put("statusofusercommentlike", true);
                }
            }
            commentMap.put("countcommentlike", commentLikeService.countByComment(x));
            commentMap.put("content", x.getContent());
            commentMap.put("modifiedDate", df.format(x.getModifiedDate()));
            commentChildListMap.add(commentMap);

        });

        int userIdLogin = 0;
        boolean roleEditComment = false;
        String avatar = "";
        String userName = "";
        if (authentication != null) {
            Users users = usersService.findByUserName(authentication.getName());
            userIdLogin = users.getUserId();
            if (request.isUserInRole("ROLE_FACEBOOK")
                    || request.isUserInRole("ROLE_GOOGLE")) {
                userName = users.getFirstName() + " " + users.getLastName();
                avatar = users.getAvatar();
            } else {
                userName = users.getUserName();
                avatar = request.getContextPath() + "/images/avatar/" + users.getAvatar();
            }
            if (request.isUserInRole("ROLE_ADMIN")
                    || article.getUsers().getUserId() == usersService.findByUserName(authentication.getName()).getUserId()) {
                roleEditComment = true;
            }
        }
        commentAllMap.put("commentparent", commentParentListMap);
        commentAllMap.put("commentchild", commentChildListMap);
        commentAllMap.put("userIdLogin", userIdLogin);
        commentAllMap.put("avatar", avatar);
        commentAllMap.put("userName", userName);
        commentAllMap.put("roleEditComment", roleEditComment);
        return commentAllMap;
    }
}
