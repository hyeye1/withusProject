package com.kh.withus.funding.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String FundingDetails() {
		
		
		
		return "funding/fundingDetails";
		
	}
	
	@RequestMapping("register.fd")
	public String FundingRegistration() {
		
		
		
		return "funding/fundingRegistration";
		
	}
}
