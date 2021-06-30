package com.kh.withus.order.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.order.model.vo.Order;

public interface OrderService {

	int selectListCount();
	ArrayList<Order> selectList(PageInfo pi);
	
	// 상세 조회
	Order slectOrderDetail(int orderNo);
	
	// 파트너 발송관리
	int selectDeliveryCount();
	ArrayList<Order> selectPartnerOrderList(PageInfo pi);
	Order selectStatusCount();
	Order selectSendInfo(int orderNo);
}
