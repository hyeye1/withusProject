package com.kh.withus.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.order.model.vo.Order;

@Repository
public class OrderDao {
	
	// 관리자
	// 관리자 주문내역 게시글 수 / 리스트 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectOrderListCount");
	}
		
	public ArrayList<Order> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderList", null, rowBounds);
	}
	
	// 관리자 주문내역 상세 조회
	public Order selectOrderDetail(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("orderMapper.selectOrderDetail", orderNo);
	}
	
	// 검색 기능 
	public ArrayList<Order> selectSearchOrder(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectSearchOrder", map);
	}
	
	
	// 파트너 발송관리
	// 프로젝트 총 주문내역 게시글 수 / 리스트
	public int selectDeilveryCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.selectDeliveryCount");
	}
	
	public ArrayList<Order> selectPartnerOrderList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectPartnerOrderList",null,rowBounds);
	}

	// 프로젝트 진행 현황
	public Order selectStatusCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selecetStatsCount");
	}
	
	// 발송모달:펀딩내역
	public Order selectOrderInfo(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("orderMapper.selectOrderInfo", orderNo);
	}

	// 환불모달:펀딩내역+환불신청내역
	public Order selectRefundInfo(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("orderMapper.selectRefundInfo", orderNo);
	}
	
	public ArrayList<Order> selectSearchPartOrder(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectSearchPartOrder", map);
	}
	
}
