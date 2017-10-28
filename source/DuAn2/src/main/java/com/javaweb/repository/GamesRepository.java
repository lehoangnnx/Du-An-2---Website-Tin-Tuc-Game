package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.javaweb.model.Games;
@Repository
public interface GamesRepository extends JpaRepository<Games, Integer> {

}
