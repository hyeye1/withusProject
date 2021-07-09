package com.kh.withus.csc.faq.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.csc.faq.model.service.FaqService;
import com.kh.withus.csc.faq.model.vo.Faq;

@Controller
public class FaqController {
	
	// 6/27 윤경생성
	@Autowired
	private FaqService fService;
	
	@RequestMapping("list.faq")
	public ArrayList<Faq> selectList(Faq f, ModelAndView mv) {
		
		ArrayList<Faq> list = fService.selectList(f);
		mv.addObject("f", f).addObject("list", list).setViewName("csc/faqListView");
		return list;
		
	}
	
	@RequestMapping("enrollForm.faq")
	public String enrollForm() {
		return "csc/faqEnrollForm";
	}
	
	/*
	@RequestMapping("insert.faq")
	public String insertFaq(int faqNo, HttpSession session, Model model) {
		
		int result = fService.insertFaq(faqNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "faq가 등록되었습니다.");
		}else {
			model.addAttribute("errorMsg", "faq가 등록되지않았습니다.");
			return "common.errorPage";
		}
		
	}
	
	@RequestMapping("updateForm.faq")
	public String updateForm(int fno, Model model) {
		model.addAttribute("f", fService.selectFaq(fno));
		return "csc/faqUpdateEnroll";
	}
	
	@RequestMapping("update.faq")
	public ArrayList<Faq> updateFaq(Faq f, HttpSession session, Model model) {
		int result = fService.insertFaq(f);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "faq가 수정되었습니다.");
		}else {
			model.addAttribute("errorMsg", "faq가 수정되지않았습니다.");
			return "common.errorPage";
		}
	}
	
	@RequestMapping("delete.faq")
	public String deleteFaq(int fno, HttpSession session, Model model) {
		
		int result = fService.deleteFaq(fno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			return "redirect:list.faq";
		}else {
			model.addAttribute("errorMsg", "삭제 실패되었습니다.");
			return "common/errorPage";
		}
	}
	*/

}
