package com.javaweb.service;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleLike;
import com.javaweb.model.Users;
import com.javaweb.repository.ArticleLikeRepository;
import com.javaweb.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleLikeServiceImpl implements  ArticleLikeService {
    @Autowired
    ArticleLikeRepository articleLikeRepository;
    @Override
    public ArticleLike findByUsersAndArticle(Users users, Article article) {
        return articleLikeRepository.findByUsersAndArticle(users, article);
    }

    @Override
    public void saveorupdate(ArticleLike articleLike) {
            articleLikeRepository.save(articleLike);
    }

    @Override
    public void delete(ArticleLike articleLike) {
        articleLikeRepository.delete(articleLike);
    }

    @Override
    public List<ArticleLike> findAll() {
        return articleLikeRepository.findAll();
    }

    @Override
    public List<ArticleLike> findAllByArticle(Article article) {
        return articleLikeRepository.findAllByArticle(article);
    }
}
