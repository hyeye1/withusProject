package com.kh.withus.order.model.service;

import java.util.ArrayList;

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
	public int selectDeliveryCount() {
		return oDao.selectDeilveryCount(sqlSession);
	}

	@Override
	public Order selectStatusCount() {
		return oDao.selectStatusCount(sqlSession);
	}
	
	@Override
	public Order selectSendInfo() {
		return oDao.selectSendInfo(sqlSession);
	}
	
	@Override
	public ArrayList<Order> selectPartnerOrderList(PageInfo pi) {
		return oDao.selectPartnerOrderList(sqlSession, pi);
	}
}
