package com.kh.withus.order.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.order.model.vo.Order;

public interface OrderService {

	int selectListCount();
	ArrayList<Order> selectList(PageInfo pi);
	
}
