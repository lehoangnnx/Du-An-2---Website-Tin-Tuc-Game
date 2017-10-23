package com.javaweb.controller;

import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.util.HtmlUtils;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletContext;

@Controller
@RequestMapping("/admin")
public class UsersController {
	@Autowired
	UsersService usersService;
	@Autowired
	RolesService rolesService;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	img imagesManager;
	@Autowired
	ServletContext context;

	// Lấy tất cả người dùng - trả về trang users
	@GetMapping("/users")
	public String users(Model model) {
		List<Users> listUsers = usersService.findAll();

		model.addAttribute("listUsers", listUsers);
		return "users";
	}

	@GetMapping("/addusers")
	public String addusers(Model model) {

		return "addusers";
	}

	@GetMapping("/updateusers-{userId}")
	public String updateusers(Model model, @PathVariable("userId") int userId) {
		System.out.println("Id Users :" + userId);
		Users user = usersService.findByUserId(userId);

		List<Roles> listRoles = rolesService.findAll();
		List<String> listRolesOfUser = new ArrayList<String>();
		for (Roles r : user.getRoleses()) {
			listRolesOfUser.add(r.getName());
		}

		model.addAttribute("user", user);
		model.addAttribute("listRoles", listRoles);
		model.addAttribute("listRolesOfUser", listRolesOfUser);
		return "updateusers";
	}

	@PostMapping("/updateuser")
	public String updateusers1(Model model, @RequestParam("roleses") List<String> roleses,
			@RequestParam("userId") int userId, @RequestParam("userName") String userName,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("status") String status, @RequestParam("avatar") MultipartFile avatar

	) {

		String monthAndYear = imagesManager.getMonthAndYearNow();
		Users user = usersService.findByUserId(userId);
		HashSet<Roles> roles = new HashSet<>();
		String photoPath = context.getRealPath("/WEB-INF/files/images/avatar/" + monthAndYear);

		try {

			user.setFirstName(HtmlUtils.htmlEscape(firstName));
			user.setLastName(HtmlUtils.htmlEscape(lastName));
			user.setStatus(status);
			for (String r : roleses) {
				roles.add(rolesService.findByName(r));
			}
			user.setRoleses(roles);

			if (!avatar.isEmpty()) {
				boolean checkFolderExists = imagesManager.checkFolderExists(photoPath);
				if (checkFolderExists) {
					String newNameFile =imagesManager.renameFile(avatar.getOriginalFilename());
					byte[] bytes = avatar.getBytes();
					Path path = Paths.get(photoPath + newNameFile);
					Files.write(path, bytes);
					user.setAvatar(monthAndYear + newNameFile);

				}

			}

			usersService.saveorupdate(user);
		} catch (Exception e) {
			model.addAttribute("error", "Sửa Thất Bại");

		}
		return "users";
	}

	@GetMapping("/delete")
	public String delete(Model model) {
		usersService.delete(504);

		// model.addAttribute("listUsers",listUsers);
		return "users";
	}

}
