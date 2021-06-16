package com.kh.withus.refund.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.withus.refund.model.service.RefundService;

@Controller
public class RefundController {
	
	@Autowired
	private RefundService rService;

	@RequestMapping("refundListView.mana")
	public String selectRefundListMana() {
		return "refund/manaRefundListView";
	}
	
	/*
	 * @RequestMapping("refundDetailView.mana") 
	 * public String selectRefundMana() {
	 * return "refund/manaRefundDetailView"; }
	 * 
	 */	
	
	
}
