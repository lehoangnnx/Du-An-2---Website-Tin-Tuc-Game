/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Interface PagesService thưc thi xử lý
* */
package com.javaweb.service;

import java.util.List;

import com.javaweb.model.Pages;

public interface PagesService {
	List<Pages> findAll();
}
