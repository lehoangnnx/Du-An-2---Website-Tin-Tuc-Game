/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface ArticleLikeService thưc thi xử lý
* */
package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleLike;
import com.javaweb.model.Users;

import java.util.List;

public interface ArticleLikeService {
    ArticleLike findByUsersAndArticle(Users users, Article article);
    void saveorupdate(ArticleLike articleLike);
    void delete(ArticleLike articleLike);
    List<ArticleLike> findAll();
    List<ArticleLike> findAllByArticle(Article article);

}
