package com.kh.withus.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundingController {
	
	@RequestMapping("list.fun")
	public String selectFundingList() {
		
		/*
		int listCount = bService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		*/
		
		return "funding/fundingListView";
		
	}
	
	@RequestMapping("list.rew")
	public String selectRewardList() {
		
		/*
		int listCount = bService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		*/
		
		return "funding/rewardListView";
		
	}

	@RequestMapping("detail.fd")
	public String FundingDetails() {
		
		/*
		int listCount = bService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		*/
		
		return "funding/fundingDetails";
		
	}
}
