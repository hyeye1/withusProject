package com.kh.withus.refund.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.refund.model.service.RefundService;
import com.kh.withus.refund.model.vo.Refund;

@Controller
public class RefundController {
	
	@Autowired
	private RefundService rService;

	// 관리자
	@RequestMapping("refundListView.mana")
	public ModelAndView selectRefundList(@RequestParam(value="currentPage", defaultValue="1")
										int currentPage, ModelAndView mv) {
		
		int totalList = rService.selectListCount();
		PageInfo pi = pagination.getPageInfo(totalList, currentPage, 5, 10);
		
		ArrayList<Refund> rList = rService.selectList(pi);
		
		mv.addObject("rList", rList)
		  .addObject("pi", pi)
		  .setViewName("refund/manaRefundListView");
		
		return mv;
	}
	@RequestMapping("refundDetail.mana")
	public String selectRefund(int rno, Model model) {
		
		Refund r = rService.selectRefund(rno);
		model.addAttribute("r", r);
		return "refund/manaRefundDetailView";
//		if(r != null) {
//		}else{
//			model.addAttribute("errorMsg","환물신청 내역 상세 조회 실패");
//			return ""; 
//		}
		
	}
  

	// 파트너 등록
	@RequestMapping("partnerEnrollForm.me") 
	public String selectPartnerEnroll() {
		return "refund/partnerEnrollForm"; 
	}
}
