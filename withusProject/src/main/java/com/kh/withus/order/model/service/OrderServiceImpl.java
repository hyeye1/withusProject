package com.kh.withus.order.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Order> selectList(PageInfo pi) {
		return null;
	}

}
