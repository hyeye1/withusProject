package com.kh.withus.csc.faq.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.csc.faq.model.dao.FaqDao;
import com.kh.withus.csc.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService {

	// 6/27 윤경 생성
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private FaqDao fDao;
	
	
	@Override
	public int selectListCount() {
		return fDao.selectListCount(sqlSession);
	}
	
	// 페이지로 안넘길건데....
	@Override
	public ArrayList<Faq> selectList(Faq f) {
		return fDao.selectList(sqlSession, f);
	}

	@Override
	public int insertFaq(Faq f) {
		return fDao.insertFaq(sqlSession, f);
	}

	@Override
	public Faq selectFaq(int faqNo) {
		return fDao.selectFaq(sqlSession, faqNo);
	}

	@Override
	public int updateFaq(Faq f) {
		return fDao.updateFaq(sqlSession, f);
	}

	@Override
	public int deleteFaq(int faqNo) {
		return fDao.deleteFaq(sqlSession, faqNo);
	}

}
