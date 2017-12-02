package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.Comment;
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
}
