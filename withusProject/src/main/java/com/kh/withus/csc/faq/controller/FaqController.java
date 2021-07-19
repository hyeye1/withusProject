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
	
	@Autowired
	private FaqService fService;
	
	
	// faq 조회
	@RequestMapping("list.faq")
	public String selectList(Model model) {
		ArrayList<Faq> list = fService.selectList();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}

	
	// faq 추가
	@RequestMapping("enrollForm.faq")
	public String enrollForm() {
		return "csc/faqEnrollForm";
	}
	
	@RequestMapping("insert.faq")
	public String insertFaq(Faq f, HttpSession session, Model model) {
		System.out.println(f);
		int result = fService.insertFaq(f);
		if(result > 0) {
			session.setAttribute("alertMsg", "faq가 등록되었습니다.");
			return "redirect:list.faq";
		}else {
			model.addAttribute("errorMsg", "faq가 등록되지않았습니다.");
			return "common/errorPage";
		}
	}
	
	
	// faq 수정
	@RequestMapping("updateForm.faq")
	public String updateForm(int fno, Model model) {
		model.addAttribute("f", fService.selectFaq(fno));
		return "csc/faqUpdateEnroll";
	}
	
	@RequestMapping("update.faq")
	public String updateFaq(Faq f, HttpSession session, Model model) {
		int result = fService.updateFaq(f);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "faq가 수정되었습니다.");
			return "redirect:list.faq?fno=" + f.getFaqNo();
		}else {
			model.addAttribute("errorMsg", "faq가 수정되지않았습니다.");
			return "common/errorPage";
		}
	}
	
	
	// faq 삭제
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
	
	
	// faq 카테고리별 버튼
	@RequestMapping("funding.faq")
	public String selectFunding(Model model) {
		ArrayList<Faq> list = fService.selectFunding();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}
	
	@RequestMapping("delivery.faq")
	public String selectDelivery(Model model) {
		ArrayList<Faq> list = fService.selectDelivery();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}
	
	@RequestMapping("exchange.faq")
	public String selectExchange(Model model) {
		ArrayList<Faq> list = fService.selectExchange();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}
	
	@RequestMapping("etc.faq")
	public String selectEtc(Model model) {
		ArrayList<Faq> list = fService.selectEtc();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}

}
