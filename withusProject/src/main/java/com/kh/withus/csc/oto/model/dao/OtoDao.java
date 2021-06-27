package com.kh.withus.csc.oto.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.csc.oto.model.vo.Oto;

@Repository
public class OtoDao {
	
	// 6/27 윤경 생성
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("otoMapper.selectListCount");
	}
	
	public ArrayList<Oto> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("otoMapper.selectList", null, rowBounds);
	}
	
	public int insertOto(SqlSessionTemplate sqlSession, Oto o) {
		return sqlSession.insert("otoMapper.insertOto");
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int otoNo) {
		return sqlSession.update("otoMapper.increaseCount");
	}
	
	public Oto selectOto(SqlSessionTemplate sqlSession, int otoNo) {
		return sqlSession.selectOne("otoMapper.selectOto");
	}
	
	public int updateOto(SqlSessionTemplate sqlSession, Oto o) {
		return sqlSession.update("otoMapper.updateOto");
	}

	public int deleteOto(SqlSessionTemplate sqlSession, int otoNo) {
		return sqlSession.update("otoMapper.deleteOTo");
	}
}
