package com.kh.withus.funding.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.funding.model.service.FundingService;
import com.kh.withus.funding.model.vo.Project;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService funService;
	
	@RequestMapping("list.fun")
	public ModelAndView selectFundingList(ModelAndView mv) {
		
		// 펀딩 상품 조회
		ArrayList<Project> list = funService.selectList();
		
		mv.addObject("list", list)
		  .setViewName("funding/fundingListView");
		
		System.out.println(list);
		
		return mv;
		
	}
	
	@RequestMapping("list.rew")
	public String selectRewardList() {
		
		
		
		return "funding/rewardListView";
		
	}

	@RequestMapping("detail.fd")
	public String selectFunding(int pno, Model model) {
		int result= funService.increaseCount(pno);
		
		if(result>0) {
			Project p = funService.selectFunding(pno);
			model.addAttribute("p", p);
			return "funding/fundingDetails";
		}else {
			model.addAttribute("errorMsg", "상세페이지 조회 실패");
			return "common/errorPage";
		}
		
		
		
		
		
		
	}
	
	@RequestMapping("register.fd")
	public String FundingRegistration() {
		
		
		
		return "funding/fundingRegistration";
		
	}
}
