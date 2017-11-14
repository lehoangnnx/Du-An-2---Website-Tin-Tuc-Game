package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.model.Pages;
import org.springframework.stereotype.Repository;

@Repository("pagesRepository")
public interface PagesRepository extends JpaRepository<Pages, Integer> {

}
