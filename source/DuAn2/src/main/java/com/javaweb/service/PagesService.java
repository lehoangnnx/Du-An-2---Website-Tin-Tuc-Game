package com.javaweb.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javaweb.model.Pages;

public interface PagesService {
	List<Pages> findAll();
}
