package com.javaweb.repository;

import com.javaweb.model.Article;
import com.javaweb.model.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

    List<Comment> findTop10ByStatusOrderByCreatedDateDesc(String status);
    List<Comment> findAllByArticleAndStatusAndSubCommentId(Article article ,String status,Integer subCommentId,Pageable pageable);
    List<Comment> findAllByArticleAndStatusAndSubCommentIdGreaterThanOrderByModifiedDateDesc(Article article,String status ,Integer subCommentId);
    Long countByArticle(Article article);

    Comment findAllByContentContainingAndStatus(String content,String status);
    List<Comment> findAllByCommentIdOrSubCommentId(Integer commentId, Integer subCommentId);
    Comment findByCommentId(Integer commentId);
}
