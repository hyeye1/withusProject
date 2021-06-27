package com.kh.withus.order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.order.model.vo.Order;

@Repository
public class OrderDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectOrderListCount");
	}
		
	public ArrayList<Order> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderList", null, rowBounds);
	}

}
