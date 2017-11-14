package com.javaweb.service;

import com.javaweb.model.Comment;

import java.util.List;

public interface CommentService {
    void saveorupdate(Comment comment);
    List<Comment> findTop10ByStatusOrderByCreatedDateDesc(String status);
}
