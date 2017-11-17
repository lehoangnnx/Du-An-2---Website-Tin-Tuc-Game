package com.javaweb.controller.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

import com.javaweb.model.Games;
import com.javaweb.service.GamesService;

@RestController
@RequestMapping("/admin")
public class AdminGamesRestController {
    @Autowired
    GamesService gamesService;

    @PostMapping("/validator-games")
	public String validatorCategorysArticles(@RequestBody Games games) {
    	Games findByName = null;
    	Games findBySlug = null;
		
		try {
			findByName = gamesService.findByName(HtmlUtils.htmlEscape(games.getName()));
			findBySlug= gamesService.findBySlug(games.getSlug());
			
			if (games.getGameId() == null) {
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
						&& !findByName.getGameId().equals(games.getGameId())
						&& !findBySlug.getGameId().equals(games.getGameId())) {
					System.out.println("2");
					return "error";
				} else if (findByName != null 
						&& !findByName.getGameId().equals(games.getGameId())) {
					System.out.println("3");
					return "errorname";
				} else if (findBySlug != null 
						&& !findBySlug.getGameId().equals(games.getGameId())) {
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
    

