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
	private OrderDao orDao;
	
	@Override
	public int selectListCount() {
		return orDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Order> selectList(PageInfo pi) {
		return orDao.selectList(sqlSession,pi);
	}

}
