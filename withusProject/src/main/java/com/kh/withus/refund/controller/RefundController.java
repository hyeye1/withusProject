package com.kh.withus.refund.controller;

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

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.community.model.vo.CommuReply;
import com.kh.withus.refund.model.service.RefundService;
import com.kh.withus.refund.model.vo.Refund;

@Controller
public class RefundController {
	
	@Autowired
	private RefundService rService;

	// 관리자
	// 환불신청 리스트 조회
	@RequestMapping("refundListView.mana")
	public ModelAndView selectRefundList(@RequestParam(value="currentPage", defaultValue="1")
										int currentPage, ModelAndView mv) {
		
		int totalList = rService.selectListCount();
		PageInfo pi = pagination.getPageInfo(totalList, currentPage, 5, 10);
		
		ArrayList<Refund> rlist = rService.selectList(pi);
		
		mv.addObject("rlist", rlist)
		  .addObject("pi", pi)
		  .setViewName("refund/manaRefundListView");
		
		return mv;
	}
	
	// 환불 신청내역 상세 보기
	@RequestMapping("refundDetail.mana")
	public String selectRefund(int rno, Model model) {
		
		Refund r = rService.selectRefund(rno);

		if(r != null) {
			model.addAttribute("r", r);
			return "refund/manaRefundDetailView";
		
		}else{
			model.addAttribute("errorMsg","환물신청 내역 상세 조회 실패");
			return "common/manaErrorPage"; 
		}
		
	}
	
	// 검색 : 페이징 처리는 아직...
	@RequestMapping("refundSearch.mana")
	public String selectSearchRefund(HttpServletRequest request, Model model) {
		
		String refundKey = request.getParameter("refundKey");
		String keyword = request.getParameter("keyword");
		String rfStatus= request.getParameter("rfStatus");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("refundKey", refundKey);
		map.put("keyword", keyword);
		map.put("rfStatus", rfStatus);
		
		ArrayList<Refund> rlist = rService.selectSearchRefund(map);
		
		model.addAttribute("rlist", rlist)
		     .addAttribute("refundKey", refundKey)
		     .addAttribute("rfStatus", rfStatus);
		
		return "refund/manaRefundListView";
		     
	}
  

}
