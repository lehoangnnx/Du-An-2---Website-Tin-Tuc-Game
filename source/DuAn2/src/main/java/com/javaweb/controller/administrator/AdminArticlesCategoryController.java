package com.javaweb.controller.administrator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javaweb.model.Article;
import com.javaweb.model.ArticleCategory;
import com.javaweb.service.ArticleCategoryService;

@Controller
@RequestMapping("/admin")
public class AdminArticlesCategoryController {
	@Autowired
	ArticleCategoryService articleCategoryService; 
	@GetMapping("/categorys/articles")
	public String showArticlesCategory(Model model) {
		List<ArticleCategory> articleCategoriesList = articleCategoryService.findAll();
		model.addAttribute("articleCategoriesList", articleCategoriesList);
		return "articlescategory";
	}
	@GetMapping("/addcategorys/articles")
	public String addcategorys() {
		
		return "addarticlescategory";
	}
	
	@PostMapping("/categorys/articles")
	public String addcategorys(Model model, @RequestParam("name") String name,
			@RequestParam("slug") String slug, @RequestParam("status") String status,
			RedirectAttributes redirectAttributes) {
			
		try {
			ArticleCategory articleCategory = new ArticleCategory(); 
			if(!name.equals("")) {
				articleCategory.setName(name);
			}
			if (!slug.equals("")) {
				articleCategory.setSlug(slug);
			}
			articleCategory.setStatus(status);
			articleCategory.setSortOrder((byte) 1);
			articleCategoryService.saveorupdate(articleCategory);
			redirectAttributes.addFlashAttribute("msg", "Thêm Danh Mục Bài Viết Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Thêm Danh Mục Bài Viết Thất Bại");
			return "redirect:/admin/addcategorys/articles";
		}
		
		return "redirect:/admin/categorys/articles";
	}
	
	@DeleteMapping("/categorys/articles")
	public String deleteAllUser(@RequestParam("arrayArticleCategoryId") List<Integer> arrayArticleCategoryId ,
			RedirectAttributes redirectAttributes) {
		
		
		try {
			arrayArticleCategoryId.forEach(x -> {
				
				ArticleCategory articleCategory = articleCategoryService.findByArticleCategoryId(x);
				articleCategory.setStatus("deleted");
				articleCategoryService.saveorupdate(articleCategory);;
			});
			
			
			redirectAttributes.addFlashAttribute("msg", "Xóa Danh Mục Bài Viết Thành Công");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("msg", "Xóa Danh Mục Bài Viết Thất Bại");
		}
		
		return "redirect:/admin/categorys/articles";
	}
}
