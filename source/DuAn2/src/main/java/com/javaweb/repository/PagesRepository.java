
/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface PagesRepository thưc thi truy vấn trưc tiếp với cơ sỡ dư liệu
* */
package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.model.Pages;
import org.springframework.stereotype.Repository;

@Repository("pagesRepository")
public interface PagesRepository extends JpaRepository<Pages, Integer> {

}
