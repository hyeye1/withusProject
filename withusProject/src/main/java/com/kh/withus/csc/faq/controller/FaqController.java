package com.kh.withus.csc.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.csc.faq.model.service.FaqService;

@Controller
public class FaqController {
	
	// 6/27 윤경생성
	@Autowired
	private FaqService fService;
	
	@RequestMapping("list.fa")
	public ModelAndView selectListConut(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = fService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 10);
		
	}

}
