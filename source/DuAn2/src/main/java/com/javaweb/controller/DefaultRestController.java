package com.javaweb.controller;


import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.model.Users;
import com.javaweb.service.ArticleCategoryService;
import com.javaweb.service.ArticleService;
import com.javaweb.service.UsersService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@RestController
public class DefaultRestController {
    @Autowired
    ArticleService articleService;
    @Autowired
    ArticleCategoryService articleCategoryService;
    @Autowired
    UsersService usersService;
    @GetMapping("/getarticle")
    public List<Map<String, Object>> get(@RequestParam(value = "page", defaultValue = "2") int page) {
        int pageSize = 10;
        System.out.println("PAGE :" + page);
        DateFormat df = new SimpleDateFormat("dd-MM-yyyy");

        List<Article> findAllArticle = articleService
                .findByStatusAndShowDateBeforeOrderByShowDateDesc("active", new Date());
        if((page * pageSize) < findAllArticle.size() && (page * pageSize) < 50 ){
            findAllArticle = findAllArticle
                    .stream().skip(pageSize * (page - 1)).limit(pageSize).collect(Collectors.toList());


            List<Map<String, Object>> articleListMap = new ArrayList<Map<String, Object>>();

            findAllArticle.forEach(x -> {
                Map<String, Object> articleMap = new HashMap<String, Object>();
                articleMap.put("title", x.getTitle());
                articleMap.put("slug", x.getSlug());
                articleMap.put("views", x.getViews());
                articleMap.put("subContent", x.getSubContent());
                articleMap.put("user", x.getUsers().getUserName());

                articleMap.put("showDate", df.format(x.getShowDate()));
                articleMap.put("imagesThumbnail", x.getImagesThumbnail());
                List<Map<String, Object>> articleCategoryListMap = new ArrayList<Map<String, Object>>();
                x.getArticleCategories().forEach(y -> {
                    Map<String, Object> articleCategoryMap = new HashMap<String, Object>();
                    articleCategoryMap.put("name", y.getName());
                    articleCategoryMap.put("slug", y.getSlug());
                    articleCategoryListMap.add(articleCategoryMap);

                });
                articleMap.put("articleCategories", articleCategoryListMap);

                articleListMap.add(articleMap);

            });
            return articleListMap;
        }else {
            return null;
        }


    }

    @GetMapping("/lay1")
    public List<Article> lay() {
        List<ArticleCategory> a = articleCategoryService.findAll();
        List<Article> b = articleService.findAll();
        b.forEach(x -> {
            if (x.getArticleId() == 278) {
                x.getArticleCategories().forEach(y -> System.out.println(y.getName() + ": NAME C"));
            }

        });
        return b;
    }

    @PostMapping("/updateuser")
    public String updateUser(@RequestBody Users users, Authentication authentication){
        try {
            if (authentication != null){
                Users updateUser = usersService.findByUserName(authentication.getName());
                updateUser.setLastName(users.getLastName());
                updateUser.setFirstName(users.getFirstName());
                updateUser.setEmail(users.getEmail());
                updateUser.setPhoneNumber(users.getPhoneNumber());
            }

        }catch (Exception e){

        }
        return null;
    }
}
