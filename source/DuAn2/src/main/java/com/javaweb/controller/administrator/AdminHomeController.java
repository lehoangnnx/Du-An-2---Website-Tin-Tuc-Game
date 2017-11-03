package com.javaweb.controller.administrator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

	/*Phương thức Get hiển thi trang index
	* Đường đẫn : /admin/index
	* Trả Về : Tên index trong file layout-administrator-tiles.xml cấu hình Apache Tiles
	*/
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	
}
