package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.Comment;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CommentService {
    void saveorupdate(Comment comment);
    List<Comment> findTop10ByStatusOrderByCreatedDateDesc(String status);
    List<Comment> findAllByStatusAndSubCommentId(String status,Integer subCommentId ,Pageable pageable);
    List<Comment> findAllByStatusAndSubCommentIdGreaterThanOrderByModifiedDateDesc(String status,Integer subCommentId);
    Long countByArticle(Article article);
}
