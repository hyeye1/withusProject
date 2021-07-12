package com.kh.withus.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.order.model.vo.Order;

public interface OrderService {

	// 관리자
	// 주문내역 게시글 수 / 리스트 조회
	int selectListCount();
	ArrayList<Order> selectList(PageInfo pi);
	
	// 주문내역 상세 조회
	Order slectOrderDetail(int orderNo);
	
	// 결제취소
	int updateOrderCancle(int orderNo);

	// 검색 페이징
	int countSearch(HashMap<String, String> map);
	// 검색 기능
	ArrayList<Order> selectSearchOrder(HashMap<String, String> map, PageInfo pi);
	
	
		
	// 사용자-파트너 발송관리
	// 프로젝트 총 주문내역 게시글 수 / 리스트
	int selectDeliveryCount(int memberNo);
	ArrayList<Order> selectPartnerOrderList(PageInfo pi, int memberNo);
	
	// 프로젝트 진행 현황
	Order selectStatusCount(int memberNo);
	
	// 검색기능
	int countSearchPartOrder(HashMap<String, Object> map);
	ArrayList<Order> selectSearchPartOrder(HashMap<String, Object> map, PageInfo pi);
	
	// 발송모달:펀딩내역
	Order selectOrderInfo(int orderNo);
	
	// 환불모달:펀딩내역+환불신청내역
	Order selectRefundInfo(int orderNo);
	
	// 발송모달 : 발송정보 입력
	int insertShippingInfo(HashMap<String, Object> map);
	
	// 환불모달 : 승인처리
	int updateRefundStatus(int orderNo);
	
	int updateOrderStatus(int orderNo);
}
