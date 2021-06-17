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
	
	// 주문내역(임시)
	@RequestMapping("orderListView.mana")
	public String selectManaOrderList() {
		return "refund/manaOrderListView";
	}
	@RequestMapping("orderDetailView.mana")
	public String selectManaOrder() {
		return "refund/manaOrderDetailView";
	}
	

	@RequestMapping("refundDetailView.mana") 
	public String selectManaRefund() {
		return "refund/manaRefundDetailView"; 
	}
  
	// 사용자
	@RequestMapping("orderNDeliveryList.part")
	public String selectOrderNDilvery() {
		return "refund/partOrderNDeliveryList";
	}
}
