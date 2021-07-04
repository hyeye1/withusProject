package com.kh.withus.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.order.model.vo.Order;

public interface OrderService {

	// 관리자 주문내역 게시글 수 / 리스트 조회
	int selectListCount();
	ArrayList<Order> selectList(PageInfo pi);
	
	// 관리자 주문내역 상세 조회
	Order slectOrderDetail(int orderNo);
	
	// 검색 기능
	ArrayList<Order> searchOrder(HashMap<String, String> map);
	
		
	// 파트너 발송관리
	// 프로젝트 총 주문내역 게시글 수 / 리스트
	int selectDeliveryCount();
	ArrayList<Order> selectPartnerOrderList(PageInfo pi);
	
	// 프로젝트 진행 현황
	Order selectStatusCount();
	
	// 발송모달:펀딩내역
	Order selectOrderInfo(int orderNo);
	
	// 환불모달:펀딩내역+환불신청내역
	Order selectRefundInfo(int orderNo);
}
