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
	// 주문내역 게시글 수 / 리스트 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("orderMapper.selectOrderListCount");
	}
		
	public ArrayList<Order> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset =(pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderList", null, rowBounds);
	}
	
	// 주문내역 상세 조회
	public Order selectOrderDetail(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("orderMapper.selectOrderDetail", orderNo);
	}
	
	// 결제 취소
	public int updateOrderCancle(SqlSessionTemplate sqlSession, int orderNo) {
		
		int test = sqlSession.selectOne("orderMapper.updateOrderCancle", orderNo);
		System.out.println(test);
		return test;
	}
	
	// 검색 페이징 처리
	public int countSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("orderMapper.countSearch", map);
	}
	
	// 검색 기능 
	public ArrayList<Order> selectSearchOrder(SqlSessionTemplate sqlSession, HashMap<String, String> map, 
			PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectSearchOrder", map, rowBounds);
	}
	
	
	// 파트너 발송관리
	// 프로젝트 총 주문내역 게시글 수 / 리스트
	public int selectDeilveryCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("orderMapper.selectDeliveryCount", memberNo);
	}
	
	public ArrayList<Order> selectPartnerOrderList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectPartnerOrderList", memberNo, rowBounds);
	}

	// 프로젝트 진행 현황
	public Order selectStatusCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("orderMapper.selecetStatsCount", memberNo);
	}
	
	// 검색 페이징
	public int countSearchPartOrder(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.selectOne("orderMapper.countSearchPartOrder", map);
	}
	
	// 검색 
	public ArrayList<Order> selectSearchPartOrder(SqlSessionTemplate sqlSession, HashMap<String, Object> map,
			PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectSearchPartOrder", map, rowBounds);
	}
	
	// 발송모달:펀딩내역
	public Order selectOrderInfo(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("orderMapper.selectOrderInfo", orderNo);
	}
	
	// 환불모달:펀딩내역+환불신청내역
	public Order selectRefundInfo(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("orderMapper.selectRefundInfo", orderNo);
	}
	
	
	//운송장입력
	public int insertShippingInfo(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return sqlSession.update("orderMapper.insertShippingInfo", map);
	}

	// 환불모달: 승인처리
	public int updateRefundStatus(SqlSessionTemplate sqlSession, int orderNo){
		
		return sqlSession.update("orderMapper.updateRefundStatus", orderNo);
	}

	public int updateOrderStatus(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("orderMapper.updateOrderStatus", orderNo);
	}

	
}
