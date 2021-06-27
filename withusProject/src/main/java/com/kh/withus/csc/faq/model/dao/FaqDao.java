package com.kh.withus.csc.faq.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.csc.faq.model.vo.Faq;

@Repository
public class FaqDao {
	
	// 6/27 윤경 생성
	
	// 왜 안되는데 ㅡㅡ;;
	public ArrayList<Faq> selectList(SqlSessionTemplate sqlSession, Faq f) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectList", f);
	}
	
	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.insert("faqMaaper.insertFaq");
	}
	
	public Faq selectFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.selectOne("faqMapper.selectFaq");
	}
	
	public int updateFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.update("faqMapper.updateFaq");
	}
	
	public int deleteFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.update("faqMapper.deleteFaq");
	}

}
