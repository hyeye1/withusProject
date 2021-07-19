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

	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, int reportNo) {
		
		/*
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		*/
		return (ArrayList)sqlSession.selectList("reportMapper.selectList", reportNo);
	}

	public String reportSubmit(SqlSessionTemplate sqlSession, int reportNo) {
		return null;
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
