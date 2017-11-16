package com.javaweb.controller.administrator;


import com.javaweb.model.Roles;

import com.javaweb.service.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;


import javax.management.relation.Role;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminRolesController {
	@Autowired
	RolesService rolesService;

	@GetMapping("/roles")
	public String showArticlesCategory(Model model,@RequestParam(name = "status", defaultValue = "active") String status) {

		List<Roles> rolesList = rolesService.findAll().stream().filter(x -> x.getStatus().equals(status))
				.collect(Collectors.toList());
		model.addAttribute("rolesList", rolesList);
		return "roles";
	}
	@GetMapping("/addroles")
	public String addcategorys(Model model ) {

		return "addroles";
	}
	@PostMapping("/roles")
	public String addcategorys(Model model, @RequestParam("name") String name,
							   @RequestParam("description") String description, @RequestParam("status") String status,
							   RedirectAttributes redirectAttributes) {

		try {
			Roles roles = new Roles();
			if(!name.equals("")) {
				roles.setName(name);
			}
			if (!description.equals("")) {
				roles.setDescription(description);
			}

			roles.setStatus(status);
			rolesService.saveorupdate(roles);
			redirectAttributes.addFlashAttribute("msg", "Thêm Quyền Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Thêm Quyền Thất Bại");
			return "redirect:/admin/addroles";
		}

		return "redirect:/admin/roles?status="+status;
	}

	@GetMapping("/roles/{roleId}")
	public String updateArticleCategory(Model model, @PathVariable("roleId") Integer roleId) {
		Roles roles = rolesService.findByRoleId(roleId);
		model.addAttribute("roles",roles);
		return "updateroles";
	}

	@PatchMapping("/roles")
	public String addcategorys(Model model, @RequestParam("name") String name,@RequestParam("roleId") Integer roleId,
							   @RequestParam("description") String description, @RequestParam("status") String status,
							   RedirectAttributes redirectAttributes) {

		try {
			Roles roles = rolesService.findByRoleId(roleId);
			if(!name.equals("")) {
				roles.setName(name);
			}
			if (!description.equals("")) {
				roles.setDescription(description);
			}

			roles.setStatus(status);
			rolesService.saveorupdate(roles);
			redirectAttributes.addFlashAttribute("msg", "Sửa Quyền Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Sửa Quyền Thất Bại");
			return "redirect:/admin/updateroles";
		}

		return "redirect:/admin/roles?status="+status;
	}

	@DeleteMapping("/roles")
	public String deleteAllUser(@RequestParam("arrayId") List<Integer> arrayId ,
								RedirectAttributes redirectAttributes) {


		try {
			arrayId.forEach(x -> {

				Roles roles= rolesService.findByRoleId(x);
				roles.setStatus("deleted");
				rolesService.saveorupdate(roles);;
			});


			redirectAttributes.addFlashAttribute("msg", "Xóa Quyền Thành Công");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("msg", "Xóa Quyền Thất Bại");
		}

		return "redirect:/admin/roles?status=active";
	}
}
