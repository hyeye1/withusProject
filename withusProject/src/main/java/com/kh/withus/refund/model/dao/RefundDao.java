package com.kh.withus.refund.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.refund.model.vo.Refund;

@Repository
public class RefundDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("refundMapper.selectListCount");
	}

	public ArrayList<Refund> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("refundMapper.selectList",null, rowBounds);
	}
	
	public Refund selectRefund(SqlSessionTemplate sqlSession, int refundNo) {
		return sqlSession.selectOne("refundMapper.selectRefund", refundNo);
	}
}
