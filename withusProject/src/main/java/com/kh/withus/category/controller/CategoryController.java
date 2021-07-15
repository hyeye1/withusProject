package com.kh.withus.category.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.withus.category.model.service.CategoryService;
import com.kh.withus.category.model.vo.Category;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService cService;
	
	// 카테고리 조회
	@RequestMapping("list.cate")
	public String menuList(Model model) {
		ArrayList<Category> list = cService.menuList();
		 
		model.addAttribute("list", list);
		System.out.println(list);
		
		return "admin/menuManaView";
		
	}
	
	
	// 카테고리 추가
	@RequestMapping("enrollForm.cate")
	public String enrollForm() {
		return "admin/menuEnrollForm";
	}
	
	@RequestMapping("insert.cate")
	public String insertCate(Category ct, HttpSession session, Model model) {
		int result = cService.insertCate(ct);
		if(result > 0) {
			session.setAttribute("alertMsg", "카테고리가 추가되었습니다.");
			return "redirect:list.cate";
		}else {
			model.addAttribute("errorMsg", "카테고리 등록을 실패했습니다.");
			return "common/manaErrorPage";
		}
	}
	
	
	// 카테고리 수정
	@RequestMapping("updateForm.cate")
	public String updateForm() {
		return "admin/menuUpdateForm";
	}
	
	@RequestMapping("update.cate")
	public String updateCate(Category ct, HttpSession session, Model model) {
		int result = cService.updateCate(ct);
		if(result > 0) {
			session.setAttribute("alertMsg", "카테고리가 수정되었습니다.");
			return "redirect:list.cate";
		} else {
			model.addAttribute("errorMsg", "수정을 실패하였습니다.");
			return "common/manaErrorPage";
		}
	}
	
	
	// 카테고리 삭제
	@RequestMapping("delete.cate")
	public String deleteCate(int cno, HttpSession session, Model model){
		int result = cService.deleteCate(cno);
		if(result > 0) {
			session.setAttribute("alertMsg", "카테고리가 삭제되었습니다.");
			return "redirect:list.cate";
		} else {
			model.addAttribute("errorMsg", "삭제를 실패하였습니다.");
			return "common/manaErrorPage";
		}
	}

}
