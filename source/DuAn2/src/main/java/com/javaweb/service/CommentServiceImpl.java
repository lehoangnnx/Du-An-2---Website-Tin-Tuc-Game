package com.javaweb.service;

import com.javaweb.model.Comment;
import com.javaweb.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
}
