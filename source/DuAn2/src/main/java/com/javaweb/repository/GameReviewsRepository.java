/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface GameReviewsRepository thưc thi truy vấn trưc tiếp với cơ sỡ dư liệu
* */
package com.javaweb.repository;

import com.javaweb.model.GameReviews;
import com.javaweb.model.Games;
import com.javaweb.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface GameReviewsRepository  extends JpaRepository<GameReviews, Integer> {
    List<GameReviews> findAllByGames(Games games);

    GameReviews findByUsersAndGames(Users users,Games games);
}
