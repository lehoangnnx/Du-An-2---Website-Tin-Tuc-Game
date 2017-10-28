package com.javaweb.service;

import com.javaweb.model.Article;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ArticleService {
    List<Article> findAll();
    void saveorupdate(Article article);
}
