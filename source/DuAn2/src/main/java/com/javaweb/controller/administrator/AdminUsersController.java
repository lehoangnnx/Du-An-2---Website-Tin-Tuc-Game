package com.javaweb.controller.administrator;

import com.javaweb.controller.ImagesManager;
import com.javaweb.model.Roles;
import com.javaweb.model.Users;
import com.javaweb.service.RolesService;
import com.javaweb.service.UsersService;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.RedirectUrlBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.HtmlUtils;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminUsersController {
	@Autowired
	UsersService usersService;
	@Autowired
	RolesService rolesService;
	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	ImagesManager imagesManager;

	@Autowired
	ServletContext context;
	@Autowired
	HttpServletRequest request;

	// Lấy tất cả người dùng - trả về trang users
	@GetMapping("/users")
	public String getAllUsers(Model model) {


		// Sort with Lambda
		// listUsers.sort(( u1, u2) -> u1.getUserName().compareTo(u2.getUserName()));

		List<Users> usersList = usersService.findAll().stream()
				.filter(x -> !x.getStatus().equals("deleted"))
				.collect(Collectors.toList());
		//newlistUsers.forEach(u -> System.out.println(u.getEmail() +"-" + u.getStatus()));
		//System.out.println(newlistUsers);
		model.addAttribute("usersList", usersList);
		return "users";
	}

	@GetMapping("/addusers")
	public String addusers(Model model) {

		return "addusers";
	}

	// Phương Thức Get Người dùng theo ID
	@GetMapping("/users/{userId}")
	public String getUserByUserId(Model model, @PathVariable("userId") int userId) {
		System.out.println("Id Users :" + userId);
		Users user = usersService.findByUserId(userId);

		List<Roles> rolesList = rolesService.findAll();
		List<String> listRolesOfUser = new ArrayList<String>();
		/*
		 * for (Roles r : user.getRoleses()) { listRolesOfUser.add(r.getName()); }
		 */
		//user.getRoleses().forEach(x -> listRolesOfUser.add(x.getName()));
		model.addAttribute("user", user);
		model.addAttribute("rolesList", rolesList);
		//model.addAttribute("listRolesOfUser", listRolesOfUser);

		return "updateusers";
	}

	// Phương thức Post - Update Người Dùng
	@PatchMapping("/users")
	public String updateUsers(Model model, @RequestParam("roleses") List<String> roleses,
			@RequestParam("userId") int userId, @RequestParam("userName") String userName,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("status") String status, @RequestParam("avatar") MultipartFile avatar,
			RedirectAttributes redirectAttributes

	) {
		System.out.println("VÀO CHƯA");
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
					String newNameFile = imagesManager.renameFile(avatar.getOriginalFilename());
					byte[] bytes = avatar.getBytes();
					Path path = Paths.get(photoPath + newNameFile);
					Files.write(path, bytes);
					user.setAvatar(monthAndYear + newNameFile);

				}

			}

			usersService.saveorupdate(user);
			// model.addAttribute("success", "Sửa Người Dùng Thành Công");
			redirectAttributes.addFlashAttribute("msg", "Sửa Người Dùng Thành Công");

		} catch (Exception e) {
			// model.addAttribute("error", "Sửa Người Dùng Thất Bại");
			redirectAttributes.addFlashAttribute("msg", "Sửa Người Dùng Thất bại");
			return "redirect:/admin/users/" + userId;

		}
		return "redirect:/admin/users/" + userId;
		// return new ModelAndView(new RedirectView("/admin/users/"+userId),"message",
		// "abc");
		// return new ModelAndView("users","message", "abc" );
	}

	/*@DeleteMapping("/users/{userId}")
	public String deleteUser(@PathVariable("userId") int userId ,RedirectAttributes redirectAttributes) {
		Users user = usersService.findByUserId(userId);
		try {
			user.setStatus("deleted");
			usersService.saveorupdate(user);
			redirectAttributes.addFlashAttribute("msg", "Xóa Người Dùng Thành Công");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("msg", "Xóa Người Dùng Thất Bại");
		}
		
		return "redirect:/admin/users";
	}*/
	@DeleteMapping("/users")
	public String deleteAllUser(@RequestParam("arrayUserId") List<Integer> arrayUserId ,RedirectAttributes redirectAttributes) {
		
		System.out.println(arrayUserId);
		try {
			arrayUserId.forEach(x -> {
				Users user = usersService.findByUserId(x);
				user.setStatus("deleted");
				usersService.saveorupdate(user);
			});
			
			
			redirectAttributes.addFlashAttribute("msg", "Xóa Người Dùng Thành Công");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("msg", "Xóa Người Dùng Thất Bại");
		}
		
		return "redirect:/admin/users";
	}
}
