package com.kh.withus.order.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.order.model.service.OrderService;
import com.kh.withus.order.model.vo.Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;

	// 관리자
	// 주무내역 조회
	@RequestMapping("orderListView.mana")
	public ModelAndView selectManaOrderList(@RequestParam(value="currentPage", defaultValue="1")
	                                        int currentPage, ModelAndView mv) {
		
		int listCount = oService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Order> olist = oService.selectList(pi);
		
		mv.addObject("olist", olist)
		  .addObject("pi", pi)
		  .setViewName("order/manaOrderListView");;
		
		return mv;
	}
	
	// 주문내역 상세
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
	
	// 주문 결제 취소
		@RequestMapping("orderUpdate.mana")
		public String updateOrderCancle(@RequestParam(defaultValue="") int ono,
										@RequestParam(defaultValue="") String cancleBtn,
										 Model model, HttpSession session) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ono", ono);
			map.put("cancleBtn", cancleBtn);
			//System.out.println(map);
			
			
			int result = oService.updateOrderCancle(map);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
				return "redirect:orderDetail.mana?ono="+ono;
			}else {
				model.addAttribute("alertMsg", "실패");
				return "common/manaErrorPage";
			}
			
		}
	
	// 검색 
	@RequestMapping("orderSearch.mana")
	public ModelAndView selectSearchOrder(@RequestParam(defaultValue="") String orderKeyword,
										  @RequestParam(defaultValue="") String keyword,
										  @RequestParam(defaultValue="") String odStatus,
										  @RequestParam(defaultValue="") String shStatus,
										  @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("orderKeyword", orderKeyword);
		map.put("keyword", keyword);
		map.put("odStatus", odStatus);
		map.put("shStatus", shStatus);
		
		//System.out.println(map);
		
		int count = oService.countSearch(map);
		
		PageInfo pi = pagination.getPageInfo(count, currentPage, 10, 10);
		
		ArrayList<Order> olist = oService.selectSearchOrder(map, pi);
			
		mv.addObject("pi", pi)
		  .addObject("olist", olist)
		  .addObject("orderKeyword",orderKeyword)
		  .addObject("keyword",keyword)
		  .addObject("odStatus",odStatus)
		  .addObject("shStatus",shStatus)
		  .setViewName("order/manaOrderListView");
		
		return mv;
	
	}
	
	
	// 사용자
	// 파트너 발송관리
	@RequestMapping("orderNDeliveryList.part")
	public String selectPartnerOrderList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
												HttpSession session, Model model) {
		
		// 로그인한 회원 정보
		Member loginUser = (Member)session.getAttribute("loginUser");
		//System.out.println(loginUser);
		
		// 로그인한 회원번호 
		int mno = loginUser.getMemberNo();
		//System.out.println(mno);
		
		int totalList = oService.selectDeliveryCount(mno);
		
		// statusBox에 출력될 건수
		Order sc = oService.selectStatusCount(mno);
		
		// 페이징 처리
		PageInfo pi = pagination.getPageInfo(totalList, currentPage, 10, 10);
		
		// 주문현황 리스트 
		ArrayList<Order> polist = oService.selectPartnerOrderList(pi, mno);
		//System.out.println(polist);
		
		if(polist.size() > 0) {
			model.addAttribute("polist", polist);
			model.addAttribute("pi",pi);
			model.addAttribute("sc", sc);
			return "myPage/partner/pagePartOrderNDeliveryList";
		}else {
			session.setAttribute("alertMsg", "프로젝트 등록을 해주세요");
			return "myPage/partner/pageMyFundingMain";
		}
		
	}
	
	// 검색	
	@RequestMapping("orderNDeliverySearch.part")
	public ModelAndView selectSearchPartOrder(@RequestParam(defaultValue="") String shStatus,
												@RequestParam(defaultValue="") String orStatus,
				  								@RequestParam(defaultValue="") String condition,
				  								@RequestParam(defaultValue="") String keyword,
			  									@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			  									HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getMemberNo();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("shStatus", shStatus);
		map.put("orStatus", orStatus);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("mno", loginUser.getMemberNo());
		//System.out.println(map);
		
		// statusBox에 출력될 건수
		Order sc = oService.selectStatusCount(mno);
		
		int count = oService.countSearchPartOrder(map);
		
		PageInfo pi = pagination.getPageInfo(count, currentPage, 10, 10);
		
		ArrayList<Order> polist = oService.selectSearchPartOrder(map, pi);
		
		mv.addObject("polist", polist)
		  .addObject("pi", pi)
		  .addObject("shStatus",shStatus)
		  .addObject("orStatus",orStatus)
		  .addObject("condition",condition)
		  .addObject("keyword",keyword)
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
		//System.out.println(o); // 펀딩내역 잘 담겼는지
		
		return new Gson().toJson(o);
	}	

	// 환불 모달 - 환불신청내역
	@ResponseBody
	@RequestMapping(value="refund.info", produces="apllication/json; charset=utf-8")
		public String ajaxSelectRefundinfo(int ono) {
		
		//System.out.println(ono);
		
		Order r = oService.selectRefundInfo(ono);
		//System.out.println(r);
		
		return new Gson().toJson(r);
	}
	
	
	// 발송정보 입력
	@RequestMapping("insertShippingInfo")
	public String insertShippingInfo(@RequestParam(defaultValue="") String company,
									 @RequestParam(defaultValue="") String sno,
									 @RequestParam(defaultValue="") String ono,
									 HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("company", company);
		map.put("sno", sno);
		map.put("ono", ono);
		System.out.println(map);
		
		int result = oService.insertShippingInfo(map);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "발송정보 입력 완료");
			return "redirect:orderNDeliveryList.part";
		}else {
			session.setAttribute("alertMsg", "실패실패");
			return "redirect:orderNDeliveryList.part";
		}
		
	}
	
	// 환불 승인/거절
/*	
	@RequestMapping("refundable.part")
	public String updateRefundStatus(int ono,  HttpSession session) {
		
		//System.out.println(ono);
		
		int refund = oService.updateRefundStatus(ono);
		int order = oService.updateOrderStatus(ono);
		//System.out.println(order);
		
		if(refund > 0 && order > 0 ) {
			//session.setAttribute("alertMsg", "환불 승인");
			return "redirect:orderNDeliveryList.part";
		}else {
			session.setAttribute("alertMsg", "실패실패");
			return "redirect:orderNDeliveryList.part";
		}
		 
	
	}
	
*/	
	
	@RequestMapping("refundable.part")
	public String updateRefundStatus(@RequestParam(defaultValue="") int ono,
										@RequestParam(defaultValue="") String rstatus,
										HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ono", ono);
		map.put("rstatus", rstatus);
		//System.out.println(map);
		
		int refund = oService.updateRefundStatus(map);
		int order = oService.updateOrderStatus(map);
		
		
		if(refund > 0 && order > 0 ) {
			//session.setAttribute("alertMsg", "환불 승인");
			return "redirect:orderNDeliveryList.part";
		}else {
			session.setAttribute("alertMsg", "실패실패");
			return "redirect:orderNDeliveryList.part";
		}
		 
	
	}
	
	
	
	
	
	
}
