/*
* Người Tạo : Nguyễn Lê Hoàng
* Ngày Tạo : 17/11/2017
* Lớp AdminRolesRestController thực thi xử lý quản lý  quyền bằng Ajax
* */


package com.javaweb.controller.administrator;

import com.javaweb.model.ArticleCategory;
import com.javaweb.model.Roles;
import com.javaweb.service.ArticleCategoryService;
import com.javaweb.service.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.HtmlUtils;

@RestController
@RequestMapping("/admin")
public class AdminRolesRestController {
	@Autowired
	RolesService rolesService;
	@PostMapping("/validator-roles")
	// Kiểm tra tên quyền bị trùng
	public String validatorRoles(@RequestBody Roles roles) {
		Roles findByName = null;

		
		try {
			findByName = rolesService.findByName(HtmlUtils.htmlEscape(roles.getName().trim()));

			
			if (roles.getRoleId() == null) {
				if (findByName != null) {
					return "errorname";
				} else {
					return "msgsuccess";
				}
			}else {
				if (findByName != null
						&& !findByName.getRoleId().equals(roles.getRoleId())) {

					return "errorname";
				} else {
					return "msgsuccess";
				}
			}
		} catch (Exception e) {
			return "msgsuccess";
		}
		
	}
}
