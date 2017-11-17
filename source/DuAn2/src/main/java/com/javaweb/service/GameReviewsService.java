package com.javaweb.service;

import com.javaweb.model.GameReviews;
import com.javaweb.model.Games;

import java.util.List;

public interface GameReviewsService {

    List<GameReviews> findAll();
    List<GameReviews> findAllByGames(Games games);
}
