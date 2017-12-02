package com.javaweb.repository;

import com.javaweb.model.Comment;
import com.javaweb.model.CommentLike;
import com.javaweb.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentLikeReponsitory extends JpaRepository<CommentLike, Integer> {

    Long countByComment(Comment comment);
    CommentLike findByCommentAndUsers(Comment comment, Users users);

}
