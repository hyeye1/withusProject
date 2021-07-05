package com.kh.withus.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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

		ArrayList<Order> olist = oService.selectList(pi);
		
		mv.addObject("olist", olist)
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
		
		if(o != null)
		{
			model.addAttribute("o", o);
			return "order/manaOrderDetailView";
			
		}else {
			model.addAttribute("errorMsg","주문내역 항목 중 누락된 내용이 포함되어 있습니다.");
			return "common/manaErrorPage";
		}
	}
	
	//검색 일단 키워드로만
	@RequestMapping("orderSearch.mana")
	public String selectOrderList(HttpServletRequest request, Model model) {
		
		String orderKeyword = request.getParameter("orderKeyword"); 
		String keyword = request.getParameter("keyword");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderKeyword", orderKeyword);
		map.put("keyword", keyword);
		
		
		ArrayList<Order> olist = oService.selectSearchOrder(map);
			
		model.addAttribute("olist", olist)
		.addAttribute("orderKeyword",orderKeyword)
		.addAttribute("keyword",keyword);
		
		return "order/manaOrderListView";
	
	}
	
	
	// 사용자
	// 파트너 발송관리
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
		
		mv.addObject("polist", polist)
		  .addObject("pi",pi)
		  .addObject("sc", sc)
		  .setViewName("myPage/partner/pagePartOrderNDeliveryList");
		return mv;
	}
	
	// 발송모달 -  주문내역
	@ResponseBody
	@RequestMapping(value="send.info", produces="application/json; charset=utf-8")
	public String ajaxSelectOrderInfo(int ono) {
		
		//System.out.println(ono); // 펀딩번호 확인		
		
		Order o = oService.selectOrderInfo(ono);
		System.out.println(o); // 펀딩내역 잘 담겼는지
		
		return new Gson().toJson(o);
	}	

	// 환불 모달 - 환불신청내역
	@ResponseBody
	@RequestMapping(value="refund.info", produces="apllication/json; charset=utf-8")
		public String ajaxSelectRefundinfo(int ono) {
		
		//System.out.println(ono);
		
		Order r = oService.selectRefundInfo(ono);
		System.out.println(r);
		
		return new Gson().toJson(r);
	}
	
	// 검색	
	@RequestMapping("orderNDeliverySearch.part")
	public String selectSearchPartOrder(@RequestParam(value="currentPage", defaultValue="1") int currentPage
            									, Model model, HttpServletRequest request) {
		
		String condition = request.getParameter("condition"); 
		String keyword = request.getParameter("keyword");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		ArrayList<Order> polist = oService.selectSearchPartOrder(map);
		
		model.addAttribute("polist", polist)
		     .addAttribute("condition",condition)
		     .addAttribute("keyword",keyword);
		
		System.out.println(condition);
		System.out.println(keyword);
		System.out.println(polist);


		return "myPage/partner/pagePartOrderNDeliveryList";
		
	}
	
}
