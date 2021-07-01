package com.kh.withus.funding.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.service.FundingService;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.order.model.vo.Order;

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
		
		return mv;
		
	}
	
	@RequestMapping("list.rew")
	public String selectRewardList(int pno, @RequestParam(value="rno", defaultValue="0") int rno, Model model) {
		
		ArrayList<FundingDetail> drList = funService.selectDetailReward(pno);
		model.addAttribute("drList", drList);
		
		if(rno != 0) { // 리워드 클릭시
			model.addAttribute("rno", rno);
		}
		
		return "funding/rewardListView";
		
	}

	@RequestMapping("detail.fd")
	public String selectFunding(int pno, Model model) {
		int result= funService.increaseCount(pno);
		
		if(result>0) {
			FundingDetail p = funService.selectFunding(pno);
			model.addAttribute("p", p);
			ArrayList<FundingDetail> rList = funService.selectReward(pno);
			model.addAttribute("rList", rList);
			return "funding/fundingDetails";
		}else {
			model.addAttribute("errorMsg", "상세페이지 조회 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("check.fun")
	public String insertOrder(Order o) {
		System.out.println(o);
		return "funding/payCheckForm";
	}
	
	@RequestMapping("register.fd")
	public String FundingRegistration() {
		
		
		
		return "funding/fundingRegistration";
		
	}
}
