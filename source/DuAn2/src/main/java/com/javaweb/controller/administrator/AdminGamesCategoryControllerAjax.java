package com.javaweb.controller.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import com.javaweb.model.GameCategory;
import com.javaweb.service.GameCategoryService;

@RestController
@RequestMapping("/admin")
public class AdminGamesCategoryControllerAjax {
	@Autowired
	GameCategoryService gameCategoryService;
	@PostMapping("/validator-gamescategory")
	public String validatorCategorysArticles(@RequestBody GameCategory gameCategory) {
		GameCategory findByName = null;
		GameCategory findBySlug = null;
		
		try {
			findByName = gameCategoryService.findByName(HtmlUtils.htmlEscape(gameCategory.getName()));
			findBySlug= gameCategoryService.findBySlug(gameCategory.getSlug());
			
			if (gameCategory.getGameCategoryId() == null) {
				if (findByName != null && findBySlug != null) {
					
					return "error";
				} else if (findByName != null) {
					
					return "errorname";
				} else if (findBySlug != null) {
					
					return "errorslug";
				} else {
					return "msgsuccess";
				}
			}else {
				if (findByName != null && findBySlug != null
						&& !findByName.getGameCategoryId().equals(gameCategory.getGameCategoryId())
						&& !findBySlug.getGameCategoryId().equals(gameCategory.getGameCategoryId())) {
					System.out.println("2");
					return "error";
				} else if (findByName != null 
						&& !findByName.getGameCategoryId().equals(gameCategory.getGameCategoryId())) {
					System.out.println("3");
					return "errorname";
				} else if (findBySlug != null 
						&& !findBySlug.getGameCategoryId().equals(gameCategory.getGameCategoryId())) {
					System.out.println("4");

					return "errorslug";
				} else {
					return "msgsuccess";
				}
			}
		} catch (Exception e) {
			return "msgsuccess";
		}
		
	}
}
