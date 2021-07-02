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
	
	public Order selectOrderDetail(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("orderMapper.selectOrderDetail", orderNo);
	}
	
	
	public int selectDeilveryCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.SelectDeliveryCount");
	}
	
	public ArrayList<Order> selectPartnerOrderList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectPartnerOrderList",null,rowBounds);
	}

	public Order selectStatusCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selecetStatsCount");
	}
	
	public Order selectOrderInfo(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("orderMapper.selectOrderInfo", orderNo);
	}

	public Order selectRefundInfo(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("orderMapper.selectRefundInfo", orderNo);
	}
	
}
