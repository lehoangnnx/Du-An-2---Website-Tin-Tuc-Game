package com.javaweb.repository;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleLike;
import com.javaweb.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleLikeRepository extends JpaRepository<ArticleLike,Integer> {
    ArticleLike findByUsersAndArticle(Users users, Article article);

    List<ArticleLike> findAllByArticle(Article article);

}
