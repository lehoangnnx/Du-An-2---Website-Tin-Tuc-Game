/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface GameReviewsService thưc thi xử lý
* */
package com.javaweb.service;

import com.javaweb.model.GameReviews;
import com.javaweb.model.Games;
import com.javaweb.model.Users;

import java.util.List;

public interface GameReviewsService {

    List<GameReviews> findAll();
    List<GameReviews> findAllByGames(Games games);
    GameReviews findByUsersAndGames(Users users, Games games);
    void saveorupdate(GameReviews gameReviews);
}
