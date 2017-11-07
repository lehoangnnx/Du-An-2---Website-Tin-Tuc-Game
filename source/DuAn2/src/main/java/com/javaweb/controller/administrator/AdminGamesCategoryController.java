package com.javaweb.controller.administrator;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

import com.javaweb.model.GameCategory;
import com.javaweb.service.ArticleCategoryService;
import com.javaweb.service.GameCategoryService;


@Controller
@RequestMapping("/admin")
public class AdminGamesCategoryController {
	@Autowired
	GameCategoryService gameCategoryService ; 
	@Autowired
	ArticleCategoryService articleCategoryService;
	@GetMapping("/games/categorys")
	public String showGamesCategory(Model model, @RequestParam(name = "status", defaultValue = "active") String status) {
		List<GameCategory> gameCategoryList = gameCategoryService.findAll()
				.stream()
				.filter(x -> x.getStatus().equals(status))
				.collect(Collectors.toList());
		model.addAttribute("gameCategoryList", gameCategoryList);
		return "gamescategory";
	}
	@GetMapping("/games/categorys/addcategorys")
	public String addGamesCategorys(Model model) {
		List<GameCategory> gameCategoryList = gameCategoryService.findAll()
				.stream()
				.filter(x -> !x.getStatus().equals("deleted"))
				.collect(Collectors.toList());
		model.addAttribute("gameCategoryList", gameCategoryList);
		return "addgamescategory"; 
	}
	
	@PostMapping("/games/categorys")
	public String addGamesCategorys(Model model, @RequestParam("name") String name,
			@RequestParam("slug") String slug, @RequestParam("status") String status,
			@RequestParam( "subGameCategoryId") Integer subGameCategoryId,
			RedirectAttributes redirectAttributes) {
			
		try {
			GameCategory gameCategory = new GameCategory(); 
			if(!name.equals("")) {
				gameCategory.setName(name);
			}
			if (!slug.equals("")) {
				gameCategory.setSlug(slug);
			}
			
				gameCategory.setSubGameCategoryId(subGameCategoryId);
			
				gameCategory.setStatus(status);
				gameCategory.setSortOrder((byte) 1);
			gameCategoryService.saveorupdate(gameCategory);
			redirectAttributes.addFlashAttribute("msg", "Thêm Danh Mục Game Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Thêm Danh Mục Game Thất Bại");
			return "redirect:/admin/games/categorys/addcategorys";
		}
		
		return "redirect:/admin/games/categorys";
	}
	
	@GetMapping("/games/categorys/{gameCategoryId}")
	public String updateArticleCategory(Model model, @PathVariable("gameCategoryId") Integer gameCategoryId) {
		GameCategory gameCategory= gameCategoryService.findByGameCategoryId(gameCategoryId);
		List<GameCategory> gameCategoryList = gameCategoryService.findAll()
				.stream()
				.filter(x -> !x.getStatus().equals("deleted"))
				.collect(Collectors.toList());
		model.addAttribute("gameCategoryList", gameCategoryList);
		model.addAttribute("gameCategory", gameCategory);
		return "updategamescategory";
	}
	
	@PatchMapping("/games/categorys")
	public String updateArticleCategory(@RequestParam("gameCategoryId") Integer gameCategoryId,
			@RequestParam("name") String name,
			@RequestParam("slug") String slug, @RequestParam("status") String status,
			@RequestParam( "subGameCategoryId") Integer subGameCategoryId,
			RedirectAttributes redirectAttributes) {
		GameCategory gameCategory = gameCategoryService.findByGameCategoryId(gameCategoryId);
		
		try {
			if (!name.equals("") && gameCategoryService.findByName(name) == null) {
				gameCategory.setName(HtmlUtils.htmlEscape(name));
			}
			if (!slug.equals("") && gameCategoryService.findBySlug(slug) == null) {
				gameCategory.setSlug(HtmlUtils.htmlEscape(slug));
			}
			gameCategory.setSubGameCategoryId(subGameCategoryId);
			gameCategory.setStatus(status);
			gameCategoryService.saveorupdate(gameCategory);
			redirectAttributes.addFlashAttribute("msg", "Sửa Danh Mục Bài Viết Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Sửa Danh Mục Bài Viết Thành Công");
			return "redirect:/admin/games/categorys/"+gameCategoryId;
		}
		
		
		return"redirect:/admin/games/categorys";
	}
	
	@DeleteMapping("/games/categorys")
	public String deleteAllUser(@RequestParam("arrayId") List<Integer> arrayId ,
			RedirectAttributes redirectAttributes) {
		
		
		try {
			arrayId.forEach(x -> {
				
				GameCategory gameCategory= gameCategoryService.findByGameCategoryId(x);
				gameCategory.setStatus("deleted");
				gameCategoryService.saveorupdate(gameCategory);;
			});
			
			
			redirectAttributes.addFlashAttribute("msg", "Xóa Danh Mục Game Thành Công");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("msg", "Xóa Danh Mục Game Thất Bại");
		} 
		
		return "redirect:/admin/games/categorys";
	}
}