package com.kh.withus.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.admin.model.service.FundingManaService;
import com.kh.withus.admin.model.vo.FundingMana;
import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;

public class FundingManaController {
	
	@Autowired
	private FundingManaService fService;
	
	
	// 리스트 조회
	@RequestMapping("ManaList.fun")
	public ModelAndView selectListCount(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = fService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<FundingMana> list = fService.selectList(pi);
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/fundingManaListView");
		
		return mv;
	}

}
