package com.javaweb.service;

import com.javaweb.model.GameReviews;
import com.javaweb.model.Games;
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
    public List<GameReviews> findAllByGames(Games games) {
        return gameReviewsRepository.findAllByGames(games);
    }
}
