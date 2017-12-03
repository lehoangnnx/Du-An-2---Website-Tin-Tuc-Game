package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.Comment;
import com.javaweb.model.Users;
import com.javaweb.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentRepository commentRepository;
    @Override
    public void saveorupdate(Comment comment) {
        commentRepository.save(comment);

    }

    @Override
    public List<Comment> findTop10ByStatusOrderByCreatedDateDesc(String status) {
        return commentRepository.findTop10ByStatusOrderByCreatedDateDesc(status);
    }

    @Override
    public List<Comment> findAllByArticleAndStatusAndSubCommentId(Article article, String status, Integer subCommentId,Pageable pageable) {
        return commentRepository.findAllByArticleAndStatusAndSubCommentId(article,status,subCommentId,pageable);
    }

    @Override
    public List<Comment> findAllByArticleAndStatusAndSubCommentIdGreaterThanOrderByModifiedDateDesc(Article article,String status, Integer subCommentId) {
        return commentRepository.findAllByArticleAndStatusAndSubCommentIdGreaterThanOrderByModifiedDateDesc(article,status,subCommentId);
    }

    @Override
    public Long countByArticle(Article article) {
        return commentRepository.countByArticle(article);
    }

    @Override
    public Comment findAllByContentContainingAndStatus(String content, String status) {
        return commentRepository.findAllByContentContainingAndStatus(content,status);
    }

    @Override
    public List<Comment> findAllByCommentIdOrSubCommentId(Integer commentId, Integer subCommentId) {
        return commentRepository.findAllByCommentIdOrSubCommentId(commentId,subCommentId);
    }

    @Override
    public Comment findByCommentId(Integer commentId) {
        return commentRepository.findByCommentId(commentId);
    }

    @Override
    public List<Comment> findAllByArticleAndStatus(Article article, String status) {
        return commentRepository.findAllByArticleAndStatus(article,status);
    }

    @Override
    public Comment findTop1ByArticleAndUsersByUserIdAndSubCommentIdOrderByCreatedDateDesc(Article article, Users users, Integer subCommentId) {
        return commentRepository.findTop1ByArticleAndUsersByUserIdAndSubCommentIdOrderByCreatedDateDesc(article,users,subCommentId);
    }
}
