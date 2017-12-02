package com.javaweb.service;

import com.javaweb.model.Comment;
import com.javaweb.model.CommentLike;
import com.javaweb.model.Users;
import com.javaweb.repository.CommentLikeReponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentLikeServiceImpl implements CommentLikeService{
    @Autowired
    CommentLikeReponsitory commentLikeReponsitory;

    @Override
    public Long countByComment(Comment comment) {
        return commentLikeReponsitory.countByComment(comment);
    }

    @Override
    public void saveorupdate(CommentLike commentLike) {
        commentLikeReponsitory.save(commentLike);

    }

    @Override
    public void delete(CommentLike commentLike) {
        commentLikeReponsitory.delete(commentLike);
    }

    @Override
    public CommentLike findByCommentAndUsers(Comment comment, Users users) {
        return commentLikeReponsitory.findByCommentAndUsers(comment,users);
    }
}
