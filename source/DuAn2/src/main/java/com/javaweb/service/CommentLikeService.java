/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface CommentLikeService thưc thi xử lý
* */
package com.javaweb.service;

import com.javaweb.model.Comment;
import com.javaweb.model.CommentLike;
import com.javaweb.model.Users;

import java.util.List;

public interface CommentLikeService {
    Long countByComment(Comment comment);
    void saveorupdate(CommentLike commentLike);
    CommentLike findByCommentAndUsers(Comment comment, Users users);
    void delete(CommentLike commentLike);
}
