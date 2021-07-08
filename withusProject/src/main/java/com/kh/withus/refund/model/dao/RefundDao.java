package com.kh.withus.refund.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.community.model.vo.CommuReply;
import com.kh.withus.refund.model.vo.Refund;

@Repository
public class RefundDao {
	
	// 관리자
	// 환불 게시글 수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("refundMapper.selectListCount");
	}

	// 환불신청 리스트 조회
	public ArrayList<Refund> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("refundMapper.selectList",null, rowBounds);
	}
	
	// 환불신청내역 상세조회
	public Refund selectRefund(SqlSessionTemplate sqlSession, int refundNo) {
		
		return sqlSession.selectOne("refundMapper.selectRefund", refundNo);
	}
	
	// 검색 기능
	public ArrayList<Refund> selectSearchRefund(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		
		return (ArrayList)sqlSession.selectList("refundMapper.selectSearchRefund", map);
	}
	
}
