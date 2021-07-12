package com.kh.withus.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.order.model.dao.OrderDao;
import com.kh.withus.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private OrderDao oDao;
	
	@Override
	public int selectListCount() {
		return oDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Order> selectList(PageInfo pi) {
		return oDao.selectList(sqlSession,pi);
	}

	@Override
	public Order slectOrderDetail(int orderNo) {
		return oDao.selectOrderDetail(sqlSession, orderNo);
	}
	
	@Override
	public int updateOrderCancle(int orderNo) {
		return oDao.updateOrderCancle(sqlSession, orderNo);
	}
	
	@Override
	public int countSearch(HashMap<String, String> map) {
		return oDao.countSearch(sqlSession, map);
	}
	
	@Override
	public ArrayList<Order> selectSearchOrder(HashMap<String, String> map, PageInfo pi) {
		return oDao.selectSearchOrder(sqlSession, map, pi);
	}
	
	// 파트너
	@Override
	public int selectDeliveryCount(int memberNo) {
		return oDao.selectDeilveryCount(sqlSession, memberNo);
	}
	
	@Override
	public ArrayList<Order> selectPartnerOrderList(PageInfo pi, int memberNo) {
		return oDao.selectPartnerOrderList(sqlSession, pi, memberNo);
	}

	@Override
	public Order selectStatusCount(int memberNo) {
		return oDao.selectStatusCount(sqlSession, memberNo);
	}
	
	@Override
	public int countSearchPartOrder(HashMap<String, Object> map) {
		return oDao.countSearchPartOrder(sqlSession, map);
	}

	@Override
	public ArrayList<Order> selectSearchPartOrder(HashMap<String, Object> map, PageInfo pi) {
		return oDao.selectSearchPartOrder(sqlSession, map, pi);
	}
	
	@Override
	public Order selectOrderInfo(int orderNo) {
		return oDao.selectOrderInfo(sqlSession, orderNo);
	}

	@Override
	public Order selectRefundInfo(int orderNo) {
		return oDao.selectRefundInfo(sqlSession, orderNo);
	}

	// 발송정보입력
	@Override
	public int insertShippingInfo(HashMap<String, Object> map) {
		return oDao.insertShippingInfo(sqlSession, map);
	}

	// 환불승인처리
	@Override
	public int updateRefundStatus(HashMap<String, Object> map) {
		return oDao.updateRefundStatus(sqlSession, map);
	}
	
	@Override
	public int updateOrderStatus(HashMap<String, Object> map) {
		return oDao.updateOrderStatus(sqlSession, map);
	}
	
	/*
	@Override
	public int updateRefundStatus(int orderNo) {
		return oDao.updateRefundStatus(sqlSession, orderNo);
	}

	@Override
	public int updateOrderStatus(int orderNo) {
		return oDao.updateOrderStatus(sqlSession, orderNo);
	}
	*/
	

}
