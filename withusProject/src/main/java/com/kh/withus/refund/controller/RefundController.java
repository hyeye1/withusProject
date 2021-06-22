package com.kh.withus.refund.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.withus.refund.model.service.RefundService;

@Controller
public class RefundController {
	
	@Autowired
	private RefundService rService;

	// 관리자
	@RequestMapping("refundListView.mana")
	public String selectManaRefundList() {
		return "refund/manaRefundListView";
	}
		

	@RequestMapping("refundDetailView.mana") 
	public String selectManaRefund() {
		return "refund/manaRefundDetailView"; 
	}
  

	// 파트너 등록
	@RequestMapping("partnerEnrollForm.me") 
	public String selectPartnerEnroll() {
		return "refund/partnerEnrollForm"; 
	}
}
