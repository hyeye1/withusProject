package com.kh.withus.csc.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.csc.faq.model.vo.Faq;

@Repository
public class FaqDao {
	
	// 6/27 윤경 생성
	
	public ArrayList<Faq> selectList(SqlSessionTemplate sqlSession, Faq f) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectList", f);
	}
	
	public int selectFaq(SqlSessionTemplate sqlSession) {
		return parseInt(sqlSession.selectList("faqMapper.selectFaq"));
	}
	
	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.insert("faqMapper.insertFaq", f);
	}
	
	public int updateFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.update("faqMapper.updateFaq", f);
	}
	
	public int deleteFaq(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.update("faqMapper.deleteFaq", fno);
	}
	

}
