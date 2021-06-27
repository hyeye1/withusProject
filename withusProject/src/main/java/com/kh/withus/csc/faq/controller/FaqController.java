package com.kh.withus.csc.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.withus.csc.faq.model.service.FaqService;

@Controller
public class FaqController {
	
	// 6/27 윤경생성
	@Autowired
	private FaqService fService;

}
