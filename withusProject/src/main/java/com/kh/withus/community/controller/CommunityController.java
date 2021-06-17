package com.kh.withus.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.withus.community.model.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;
	
	@RequestMapping("community.me")
	public String community() {
		return "community/communityMain";
	}
}
