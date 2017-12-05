/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp AdminHomeController thực thi xử lý trang chủ
* */

package com.javaweb.controller.administrator;

import javax.servlet.http.HttpSession;

import com.javaweb.model.Article;
import com.javaweb.model.Games;
import com.javaweb.model.Users;
import com.javaweb.service.ArticleService;
import com.javaweb.service.GamesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaweb.service.UsersService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {
	@Autowired
	UsersService usersService;
	@Autowired
	ArticleService articleService;

	@Autowired
	GamesService gamesService;
	/*Phương thức Get hiển thi trang index
	* Đường đẫn : /admin/index
	* Trả Về : Tên index trong file layout-administrator-tiles.xml cấu hình Apache Tiles
	*/
	@GetMapping("/index")
	public String index(Model model, Authentication authentication, HttpSession session) {
		List<Article> articleList = articleService.findAll();
		List<Users> usersServiceList = usersService.findAll();
		List<Games> gamesList = gamesService.findAll();
		if (authentication != null) {
			System.out.println(authentication.getAuthorities());
			session.setAttribute("user", usersService.findByUserName(authentication.getName()));
			
		}
		model.addAttribute("articleList",articleList.size());
		model.addAttribute("usersServiceList",usersServiceList.size());
		model.addAttribute("gamesList",gamesList.size());
		return "index";
	}
	
	
}
