package com.javaweb.controller.administrator;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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

import com.javaweb.model.ArticleCategory;
import com.javaweb.service.ArticleCategoryService;

@Controller
@PreAuthorize("hasRole('ADMIN')")
@RequestMapping("/admin")
public class AdminArticlesCategoryController {
	@Autowired
	ArticleCategoryService articleCategoryService;


	@GetMapping("/articles/categorys")
	public String showArticlesCategory(Model model,@RequestParam(name = "status", defaultValue = "active") String status) {
		List<ArticleCategory> articleCategoriesList = articleCategoryService.findAllByStatusOrderByArticleCategoryIdDesc(status);
		model.addAttribute("articleCategoriesList", articleCategoriesList);
		return "articlescategory";
	}
	@GetMapping("/articles/categorys/addcategorys")
	public String addcategorys(Model model ) {
		List<ArticleCategory> articleCategoryList= articleCategoryService.findAllByStatusOrderByArticleCategoryIdDesc("active");
		model.addAttribute("articleCategoryList", articleCategoryList);
		return "addarticlescategory"; 
	}
	
	@PostMapping("/articles/categorys")
	public String addcategorys(Model model, @RequestParam("name") String name,
			@RequestParam("slug") String slug, @RequestParam("status") String status,
			@RequestParam( "subArticleCategoryId") Integer subArticleCategoryId,
			RedirectAttributes redirectAttributes) {
			
		try {
			ArticleCategory articleCategory = new ArticleCategory(); 
			if(!name.equals("")) {
				articleCategory.setName(name);
			}
			if (!slug.equals("")) {
				articleCategory.setSlug(slug);
			}
			
				articleCategory.setSubArticleCategoryId(subArticleCategoryId);
			
			articleCategory.setStatus(status);
			articleCategory.setSortOrder((byte) 1);
			articleCategoryService.saveorupdate(articleCategory);
			redirectAttributes.addFlashAttribute("msg", "Thêm Danh Mục Bài Viết Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Thêm Danh Mục Bài Viết Thất Bại");
			return "redirect:/admin/articles/categorys/addcategorys";
		}
		
		return "redirect:/admin/articles/categorys?status="+status;
	}
	
	@GetMapping("/articles/categorys/{articleCategoryId}")
	public String updateArticleCategory(Model model, @PathVariable("articleCategoryId") Integer articleCategoryId) {
		ArticleCategory articleCategory = articleCategoryService.findByArticleCategoryId(articleCategoryId);
		List<ArticleCategory> articleCategoryList= articleCategoryService.findAllByStatusOrderByArticleCategoryIdDesc("active");
		model.addAttribute("articleCategoryList", articleCategoryList);
		model.addAttribute("articleCategory", articleCategory);
		return "updatearticlescategory";
	}
	
	@PatchMapping("/articles/categorys")
	public String updateArticleCategory(@RequestParam("articleCategoryId") Integer articleCategoryId,
			@RequestParam("name") String name,
			@RequestParam("slug") String slug, @RequestParam("status") String status,
			@RequestParam( "subArticleCategoryId") Integer subArticleCategoryId,
			RedirectAttributes redirectAttributes) {
		ArticleCategory articleCategory = articleCategoryService.findByArticleCategoryId(articleCategoryId);
		
		try {
			if (!name.equals("") && articleCategoryService.findByName(name) == null) {
				articleCategory.setName(HtmlUtils.htmlEscape(name));
			}
			if (!slug.equals("") && articleCategoryService.findBySlug(HtmlUtils.htmlEscape(slug)) == null) {
				articleCategory.setSlug(HtmlUtils.htmlEscape(slug));
			}
			articleCategory.setSubArticleCategoryId(subArticleCategoryId);
			articleCategory.setStatus(status);
			articleCategoryService.saveorupdate(articleCategory);
			redirectAttributes.addFlashAttribute("msg", "Sửa Danh Mục Bài Viết Thành Công");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg", "Sửa Danh Mục Bài Viết Thành Công");
			return "redirect:/admin/articles/categorys/"+articleCategoryId;
		}
		
		
		return"redirect:/admin/articles/categorys?status="+status;
	}
	
	@DeleteMapping("/articles/categorys")
	public String deleteAllUser(@RequestParam("arrayId") List<Integer> arrayId ,
			RedirectAttributes redirectAttributes) {
		
		
		try {
			arrayId.forEach(x -> {
				
				ArticleCategory articleCategory = articleCategoryService.findByArticleCategoryId(x);
				articleCategory.setStatus("deleted");
				articleCategoryService.saveorupdate(articleCategory);;
			});
			
			
			redirectAttributes.addFlashAttribute("msg", "Xóa Danh Mục Bài Viết Thành Công");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("msg", "Xóa Danh Mục Bài Viết Thất Bại");
		}
		
		return "redirect:/admin/articles/categorys?status=active";
	}
}
