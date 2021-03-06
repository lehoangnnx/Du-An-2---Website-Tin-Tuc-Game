/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface CommentService thưc thi xử lý
* */
package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.Comment;
import com.javaweb.model.Users;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CommentService {
    void saveorupdate(Comment comment);
    List<Comment> findTop10ByStatusOrderByCreatedDateDesc(String status);
    List<Comment> findAllByArticleAndStatusAndSubCommentId(Article article ,String status,Integer subCommentId,Pageable pageable);
    List<Comment> findAllByArticleAndStatusAndSubCommentIdGreaterThanOrderByModifiedDateDesc(Article article ,String status,Integer subCommentId);
    Long countByArticle(Article article);
    Comment findAllByContentContainingAndStatus(String content,String status);
    List<Comment> findAllByCommentIdOrSubCommentId(Integer commentId, Integer subCommentId);
    Comment findByCommentId(Integer commentId);
    List<Comment> findAllByArticleAndStatus(Article article,String status);
    Comment findTop1ByArticleAndUsersByUserIdAndSubCommentIdOrderByCreatedDateDesc
            (Article article, Users users, Integer subCommentId);
}
