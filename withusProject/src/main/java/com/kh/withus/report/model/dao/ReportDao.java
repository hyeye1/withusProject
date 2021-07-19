package com.kh.withus.report.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.report.model.vo.Report;

@Repository
public class ReportDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.selectListCount");
	}

	public ArrayList<Report> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectList", null, rowBounds);
	}

	
	public int reportReset(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("reportMapper.resetReport", rno);
	}

	public int reportSubmit(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("reportMapper.submitReport", rno);
	}

	/*
	public int countSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("reportMapper.countSearch", map);
	}

	public ArrayList<Report> selectSearchReport(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectSearchReport", map, rowBounds);
	}
	*/
	

}
