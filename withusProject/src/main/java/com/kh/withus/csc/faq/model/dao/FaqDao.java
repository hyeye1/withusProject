package com.kh.withus.csc.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.csc.faq.model.vo.Faq;

@Repository
public class FaqDao {
	
	
	// ------------------ 사용자 --------------------
	
	public ArrayList<Faq> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectList");
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

	public Faq selectFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.selectOne("faqMapper.selectFaq", faqNo);
	}
	
	public ArrayList<Faq> selectFunding(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectFunding");
	}

	public ArrayList<Faq> selectDelivery(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectDelivery");
	}

	public ArrayList<Faq> selectExchange(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectExchange");
	}
	
	public ArrayList<Faq> selectEtc(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectEtc");
	}
	
	
	
	
	// ------------------ 관리자 --------------------

	
	public ArrayList<Faq> selectManaList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectManaList");
	}

	public int insertManaFaq(SqlSessionTemplate sqlSession, Faq fM) {
		return sqlSession.insert("faqMapper.insertFaq", fM);
	}

	public Faq selectManaFaq(SqlSessionTemplate sqlSession, int fnoM) {
		return sqlSession.selectOne("faqMapper.selectFaq", fnoM);
	}
	
	public int updateManaFaq(SqlSessionTemplate sqlSession, Faq fM) {
		return sqlSession.update("faqMapper.updateFaq", fM);
	}

	public int deleteManaFaq(SqlSessionTemplate sqlSession, int fnoM) {
		return sqlSession.update("faqMapper.deleteFaq", fnoM);
	}

	public ArrayList<Faq> selectManaFunding(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectFunding");
	}

	public ArrayList<Faq> selectManaDelivery(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectDelivery");
	}

	public ArrayList<Faq> selectManaExchange(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectExchange");
	}

	public ArrayList<Faq> selectManaEtc(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("faqMapper.selectEtc");
	}

	

}
