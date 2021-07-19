package com.kh.withus.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.report.model.service.ReportService;
import com.kh.withus.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	
	// 신고회원 조회
	@RequestMapping("reportList.mana")
	public ModelAndView selectReportList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = rService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Report> list = rService.selectList(pi);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("report/reportListView");
		return mv;
	}
	
	// 신고 거절 
	@ResponseBody
	@RequestMapping("reportReset.mana")
	public String reportReset(int rno, HttpSession session , Model model) {
		
		int result = rService.reportReset(rno);
		
		if(result > 0) {
			session.setAttribute("alerMsg", "회원상태를 유지합니다.");
			return "redirect:reportList.mana";
		}else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorManaPage";
		}
	}
	
	// 신고받기 -> 회원강퇴
	@ResponseBody
	@RequestMapping("reportSubmit.mana")
	public String reportSubmit(int rno, HttpSession session, Model model) {
		
		int result = rService.reportSubmit(rno);
		
		if(result > 0) {
			session.setAttribute("alerMsg", "회원탈퇴가 완료되었습니다.");
			return "redirect:reportList.mana";
		}else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorManaPage";
		}
		
	}
	
	
	
	// 강제 탈퇴
	
	// 신고리스트에서 검색
		/*
		@RequestMapping("searchReport.mana")
		public ModelAndView selectSearchReport(@RequestParam(defaultValue="") String searchKey, @RequestParam(defaultValue="") String keyword, @RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("searchKey", searchKey);
			map.put("keyword", keyword);
			
			int count = rService.countSearch(map);
			
			PageInfo pi = pagination.getPageInfo(count, currentPage, 10, 5);
			ArrayList<Report> list = rService.selectSearchReport(map, pi);
			
			mv.addObject("pi", pi)
			  .addObject("list", list)
			  .addObject("searchKey", searchKey)
			  .addObject("keyword", keyword)
			  .setViewName("report/reportListView");
			return mv;
			
		}
		*/

}
