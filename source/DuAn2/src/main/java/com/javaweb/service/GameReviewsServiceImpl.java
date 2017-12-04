/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp GameReviewsServiceImpl kế thừ Interface GameReviewsService thưc thi xử lý
* */
package com.javaweb.service;

import com.javaweb.model.GameReviews;
import com.javaweb.model.Games;
import com.javaweb.model.Users;
import com.javaweb.repository.GameReviewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameReviewsServiceImpl implements GameReviewsService {
    @Autowired
    GameReviewsRepository gameReviewsRepository;

    @Override
    public List<GameReviews> findAll() {
        return gameReviewsRepository.findAll();
    }

    @Override
    public GameReviews findByUsersAndGames(Users users, Games games) {
        return gameReviewsRepository.findByUsersAndGames(users,games);
    }

    @Override
    public List<GameReviews> findAllByGames(Games games) {
        return gameReviewsRepository.findAllByGames(games);
    }

    @Override
    public void saveorupdate(GameReviews gameReviews) {
        gameReviewsRepository.save(gameReviews);
    }
}
