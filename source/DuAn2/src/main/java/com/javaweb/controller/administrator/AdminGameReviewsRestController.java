/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp AdminGameReviewsRestController thực thi quản lý reviews games bằng Ajax
* */


package com.javaweb.controller.administrator;

import com.javaweb.model.GameReviews;
import com.javaweb.model.Games;
import com.javaweb.model.Users;
import com.javaweb.service.GameReviewsService;
import com.javaweb.service.GamesService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class AdminGameReviewsRestController {
    @Autowired
    GameReviewsService gameReviewsService;
    @Autowired
    UsersService usersService;
    @Autowired
    GamesService gamesService;
    @PostMapping("/saveorupdategamereviews")
    // Lưu hoặc sửa đánh giá game
    public String saveorupdategamereviews(@RequestParam("starreview") Integer starreview, @RequestParam("gameId") Integer gameId,
                                          Authentication authentication){
        GameReviews gameReviews =null;
        try {
                Users users = usersService.findByUserName(authentication.getName());
                Games games = gamesService.findByGameId(gameId);
                gameReviews = gameReviewsService.findByUsersAndGames(users,games);
                if(gameReviews == null){
                    GameReviews newGameReviews = new GameReviews();
                    newGameReviews.setCreateDate(new Date());
                    newGameReviews.setUsers(users);
                    newGameReviews.setGames(games);
                    newGameReviews.setStatus("active");
                    newGameReviews.setReview(starreview);
                    gameReviewsService.saveorupdate(newGameReviews);

                }else {
                    gameReviews.setReview(starreview);
                    gameReviewsService.saveorupdate(gameReviews);
                }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return null;
    }
}
