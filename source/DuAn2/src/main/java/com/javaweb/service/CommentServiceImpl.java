package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.Comment;
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
}
