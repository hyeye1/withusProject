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
	public int searchCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public ArrayList<Order> selectSearchOrder(HashMap<String, String> map) {
		return oDao.selectSearchOrder(sqlSession, map);
	}
	

	@Override
	public int selectDeliveryCount() {
		return oDao.selectDeilveryCount(sqlSession);
	}
	
	@Override
	public ArrayList<Order> selectPartnerOrderList(PageInfo pi) {
		return oDao.selectPartnerOrderList(sqlSession, pi);
	}

	@Override
	public Order selectStatusCount() {
		return oDao.selectStatusCount(sqlSession);
	}
	
	@Override
	public Order selectOrderInfo(int orderNo) {
		return oDao.selectOrderInfo(sqlSession, orderNo);
	}

	@Override
	public Order selectRefundInfo(int orderNo) {
		return oDao.selectRefundInfo(sqlSession, orderNo);
	}

	@Override
	public int searchPartOrderCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Order> selectSearchPartOrder(HashMap<String, String> map) {
		return oDao.selectSearchPartOrder(sqlSession, map);
	}
}
