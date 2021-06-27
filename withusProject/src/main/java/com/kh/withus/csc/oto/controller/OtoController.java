package com.kh.withus.csc.oto.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.csc.oto.model.service.OtoService;
import com.kh.withus.csc.oto.model.vo.Oto;

@Controller
public class OtoController {

	// 6/27 윤경 생성
	@Autowired
	private OtoService oService;
	
	@RequestMapping("list.oto")
	public ModelAndView selectOtoList(@RequestParam (value="currentPage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = oService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Oto> list = oService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("oto/otoListView");
		
		return mv;
	}
	
}
