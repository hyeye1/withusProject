package com.kh.withus.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.order.model.service.OrderService;
import com.kh.withus.order.model.vo.Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;

	// 관리자
	/*
	 * @RequestMapping("orderListView.mana") public String selectManaOrderList() {
	 * return "order/manaOrderListView"; }
	 */
	@RequestMapping("orderListView.mana")
	public ModelAndView selectManaOrderList(@RequestParam(value="currentPage", defaultValue="1")
	                                        int currentPage, ModelAndView mv) {
		
		int listCount = oService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<Order> oList = oService.selectList(pi);
		
		mv.addObject("oList", oList)
		  .addObject("pi", pi)
		  .setViewName("order/manaOrderListView");;
		
		return mv;
	}
	
	
	@RequestMapping("orderDetailView.mana")
	public String selectManaOrder() {
		return "order/manaOrderDetailView";
	}
	

	// 사용자
	@RequestMapping("orderNDeliveryList.part")
	public String selectOrderNDilvery() {
		return "myPage/partner/pagePartOrderNDeliveryList";
	}

}
