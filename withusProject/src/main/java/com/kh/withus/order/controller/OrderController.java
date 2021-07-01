package com.kh.withus.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
/*	
	@RequestMapping("orderDetailView.mana")
	public String selectManaOrder() {
		return "order/manaOrderDetailView";
	}
*/
	@RequestMapping("orderDetail.mana")
	public String selectOrder(int ono, Model model) {
		
		Order o = oService.slectOrderDetail(ono);
		
		model.addAttribute("o", o);
		return "order/manaOrderDetailView";
//		if(o != null) {
//			
//		}else {
//			model.addAttribute("errorMsg","주문내역 상세 조회 실패");
//			return "";
//		}
	}
	
	
	// 사용자
/*
	@RequestMapping("orderNDeliveryList.part")
	public String selectOrderNDilvery() {
		return "myPage/partner/pagePartOrderNDeliveryList";
	}
*/

	@RequestMapping("orderNDeliveryList.part")
	public ModelAndView selectPartnerOrderList(@RequestParam(value="currentPage", defaultValue="1") int currentPage
			                                   , ModelAndView mv) {
		
		int totalList = oService.selectDeliveryCount();
		// statusBox에 출력될 건수
		Order sc = oService.selectStatusCount();
		// 페이징 처리
		PageInfo pi = pagination.getPageInfo(totalList, currentPage, 10, 10);
		// 주문현황 리스트 
		ArrayList<Order> polist = oService.selectPartnerOrderList(pi);
		// 발송정보 입력창 , 해쉬맵 or 자바 스크립트로
		//Order oi = oService.selectSendInfo();
		//Order oi = oService.selectSendInfo(ono);
		// 펀딩금 반화 신청창
		
		mv.addObject("polist", polist)
		  .addObject("pi",pi)
		  .addObject("sc", sc)
		  //.addObject("oi", oi)
		  .setViewName("myPage/partner/pagePartOrderNDeliveryList");
		//System.out.println(oi);
		return mv;
	}
	
}
