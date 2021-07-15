package com.kh.withus.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.category.model.service.CategoryService;
import com.kh.withus.category.model.vo.Category;

public class CategoryController {
	
	@Autowired
	private CategoryService cService;
	
	// 카테고리 조회
	@RequestMapping("list.cate")
	public String MenuList(Category ct, Model model) {
		List<Category> list = cService.MenuList(ct);
		model.addAttribute("list", list);
		
		return "admin/menuManaView";
		
	}

}
